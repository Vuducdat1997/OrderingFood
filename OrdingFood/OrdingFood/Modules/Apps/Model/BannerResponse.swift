//
//  BannerResponse.swift
//  OrdingFood
//
//  Created by Vu Dat on 26/12/2021.
//

import Foundation

struct BannerResponse: Codable {
    var success: Bool?
    var banner: [BannerApp]?
    
    enum Codingkeys: String, CodingKey {
        case success,banner
    }
}
