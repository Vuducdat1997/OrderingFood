//
//  SupplierResponse.swift
//  OrdingFood
//
//  Created by Vu Dat on 28/12/2021.
//

import Foundation
struct SupplierResponse: Codable {
    var success: Bool?
    var supplier: Supplier?
    var product: [Product]?
    
    enum CodingKeys: String, CodingKey {
        case success,supplier,product
    }
}
