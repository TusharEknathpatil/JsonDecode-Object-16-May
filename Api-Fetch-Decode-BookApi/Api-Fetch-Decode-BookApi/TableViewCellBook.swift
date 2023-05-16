//
//  TableViewCellBook.swift
//  Api-Fetch-Decode-BookApi
//
//  Created by Mac on 16/05/23.
//

import UIKit

class TableViewCellBook: UITableViewCell {

    @IBOutlet weak var imageOfBook: UIImageView!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var bookIdLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
