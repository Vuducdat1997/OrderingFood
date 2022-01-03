//
//  ProductAPI.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import Foundation
import Moya

enum ProductAPI {
    case getAllProduct
    case getPoroductPopular
}

extension ProductAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://192.168.0.106:5000") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getAllProduct:
            return "api/product/"
            
        case .getPoroductPopular:
            return "api/product/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllProduct:
            return .get
        case .getPoroductPopular:
            return .get
        }
    }
    
    var sampleData: Data {
        Data()
        
    }
    
    var task: Task {
        switch self {
        case .getAllProduct:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .getPoroductPopular:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
