//
//  OrderDetail.swift
//  OrdingFood
//
//  Created by Vu Dat on 30/12/2021.
//

import Foundation

struct OrderDetail: Codable {
    
    var quantily: String?
    var product: Product?
    
    enum Codingkeys: String, CodingKey {
        case quantily,product
    }

}
