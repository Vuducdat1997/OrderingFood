//
//  CategoryIconResponse.swift
//  OrdingFood
//
//  Created by Vu Dat on 27/12/2021.
//

import Foundation

struct CategoryResponse: Codable {
    var success: Bool?
    var productCategory: [Category]?
    
    enum Codingkeys: String, CodingKey {
        case success,productCategory
    }
}
