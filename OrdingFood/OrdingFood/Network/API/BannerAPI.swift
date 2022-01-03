//
//  BannerAPI.swift
//  OrdingFood
//
//  Created by Vu Dat on 26/12/2021.
//

import Foundation
import Moya

enum BannerAPI {
    case getBanner
}

extension BannerAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://192.168.0.106:5000") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getBanner:
            return "/api/banner/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBanner:
            return .get

        }
    }
    
    var sampleData: Data {
        Data()
        
    }
    
    var task: Task {
        switch self {
        case .getBanner:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)

        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
