//
//  Cart.swift
//  OrdingFood
//
//  Created by Vu Dat on 02/01/2022.
//

import Foundation
struct Cart: Codable {
    var supplierId: String?
    var nameSupplier: String?
    var orderDetails: [OrderDetail]?
    
    enum Codingkeys: String, CodingKey {
        case supplierId,nameSupplier,orderDetails
    }
}
