//
//  UserCredial.swift
//  OrdingFood
//
//  Created by macbook on 13/12/2021.
//

import Foundation

struct UserCredential: Codable {
    var username: String?
    var password: String?
    
    enum Codingkeys: String, CodingKey {
        case username,password
    }
}
