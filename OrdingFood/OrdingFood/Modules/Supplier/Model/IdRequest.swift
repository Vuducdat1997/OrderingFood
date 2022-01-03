//
//  SupplierRequest.swift
//  OrdingFood
//
//  Created by Vu Dat on 28/12/2021.
//

import Foundation
struct IdRequest: Codable {
    var id: String?
    
    enum Codingkeys: String, CodingKey {
        case id
    }
}
