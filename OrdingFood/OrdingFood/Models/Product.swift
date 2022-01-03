//
//  Product.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import Foundation

struct Product: Codable {
    var _id: String?
    var name: String?
    var title: String?
    var price: String?
    var url: String?
    var type: String?
    var order: String?
    var supplierId: String?
    
    enum Codingkeys: String, CodingKey {
        case _id,name,title,price,url,type,order,supplierId
    }
}
