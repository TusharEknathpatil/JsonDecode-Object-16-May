//
//  ViewController.swift
//  Api-Fetch-Decode-BookApi
//
//  Created by Mac on 16/05/23.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

    @IBOutlet weak var bookTableView: UITableView!
    var books:[Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    func fetchData() {
        guard let url = URL(string: "https://api.itbook.store/1.0/new") else {
            return
        }
        URLSession.shared.dataTask(with: url) {
            data,response,error in
            
            guard let okData = data else {
                return
            }
            
            do {
                var apiResponse = try JSONDecoder().decode(ApiResponse.self, from: okData)
                self.books = apiResponse.books
                print(self.books.count)
                
            }
            catch {
                print("error Occurs")
            }
            
            DispatchQueue.main.async {
                self.bookTableView.reloadData()
            }
        }.resume()
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = bookTableView.dequeueReusableCell(withIdentifier: "TableViewCellBook", for: indexPath  ) as? TableViewCellBook else {return UITableViewCell()}
        cell.bookIdLabel.text = books[indexPath.row].title
        cell.priceLabel.text = books[indexPath.row].price
        cell.subTitleLabel.text = books[indexPath.row].subtitle
        var imageString = URL(string: books[indexPath.row].image)
        cell.imageOfBook.kf.setImage(with: imageString)
        return cell
    }
    
    
}
