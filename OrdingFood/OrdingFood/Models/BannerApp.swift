//
//  BannerApp.swift
//  OrdingFood
//
//  Created by Vu Dat on 26/12/2021.
//

import Foundation

struct BannerApp: Codable {
    var _id: String?
    var title: String?
    var imageUrl: String?
    var order: String?
    var status: String?
    var supplierId: String?
    
    enum Codingkeys: String, CodingKey {
        case _id,title,imageUrl,order,status,supplierId
    }
}
