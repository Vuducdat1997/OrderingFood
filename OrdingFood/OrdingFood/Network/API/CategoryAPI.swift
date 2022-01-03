//
//  CategoryAPI.swift
//  OrdingFood
//
//  Created by Vu Dat on 27/12/2021.
//

import Foundation
import Moya

enum CategoryAPI {
    case getCategoryApp
}

extension CategoryAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://192.168.0.106:5000") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getCategoryApp:
            return "/api/category/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCategoryApp:
            return .get

        }
    }
    
    var sampleData: Data {
        Data()
        
    }
    
    var task: Task {
        switch self {
        case .getCategoryApp:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)

        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
