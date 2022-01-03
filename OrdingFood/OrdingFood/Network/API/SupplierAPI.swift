//
//  SupplierAPI.swift
//  OrdingFood
//
//  Created by Vu Dat on 28/12/2021.
//

import Foundation
import Moya

enum SupplierAPI {
    case getSupplier(id: IdRequest)
}

extension SupplierAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://192.168.0.106:5000") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getSupplier:
            return "/api/supplier/getSupplier/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSupplier:
            return .post

        }
    }
    
    var sampleData: Data {
        Data()
        
    }
    
    var task: Task {
        switch self {
        case .getSupplier(let id):
            return .requestJSONEncodable(id)

        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
