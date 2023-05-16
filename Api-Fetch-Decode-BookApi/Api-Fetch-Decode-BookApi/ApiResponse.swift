//
//  ApiResponse.swift
//  Api-Fetch-Decode-BookApi
//
//  Created by Mac on 16/05/23.
//

import Foundation

struct ApiResponse:Decodable {
    var error:String
    var total:String
    var books:[Book]

}

struct Book:Decodable {
    var title:String
    var subtitle:String
    var isbn13:String
    var price:String
    var image:String
    var url:String    

}
