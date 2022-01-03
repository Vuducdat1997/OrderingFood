//
//  ProductResponse.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import Foundation

struct ProductResponse: Codable {
    var success: Bool?
    var product: [Product]?
    
    enum CodingKeys: String, CodingKey {
        case success, product
    }
}
