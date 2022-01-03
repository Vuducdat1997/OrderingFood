//
//  Supplier.swift
//  OrdingFood
//
//  Created by Vu Dat on 28/12/2021.
//

import Foundation
struct Supplier: Codable {
    var _id: String?
    var name: String?
    var title: String?
    var address: String?
    var contact: String?
    var bannerUrl: String?
    var iconUrl: String?
    
    enum Codingkeys: String, CodingKey {
        case _id,name,title,address,contact,bannerUrl,iconUrl
    }
}
