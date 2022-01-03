//
//  Category.swift
//  OrdingFood
//
//  Created by Vu Dat on 27/12/2021.
//

import Foundation

struct Category: Codable {
    var _id: String?
    var name: String?
    var status: String?
    var type: String?
    var urlIcon: String?
    
    enum Codingkeys: String, CodingKey {
        case _id,name,status,type,urlIcon
    }
}
