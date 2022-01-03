//
//  RegisterCredential.swift
//  OrdingFood
//
//  Created by Vu Dat on 02/01/2022.
//

import Foundation

struct RegisterCredential: Codable {
    var username: String?
    var password: String?
    var address: String?
    var phoneNumber: String?
    
    enum Codingkeys: String, CodingKey {
        case username,password,address,phoneNumber
    }
}
