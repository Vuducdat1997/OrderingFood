//
//  LoginResponse.swift
//  OrdingFood
//
//  Created by macbook on 13/12/2021.
//

import Foundation

struct LoginResponse: Codable {
    var success: Bool?
    var message: String?
    var accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case success, message, accessToken
    }
}
