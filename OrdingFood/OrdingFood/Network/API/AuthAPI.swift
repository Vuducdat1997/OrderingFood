//
//  UserAPI.swift
//  OrdingFood
//
//  Created by macbook on 13/12/2021.
//

import UIKit
import Moya

enum AuthAPI {
    case login(cre: UserCredential)
    case register(cre: RegisterCredential)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://192.168.0.106:5000") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/auth/login"
        case .register:
            return "api/auth/register"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        }
    }
    
    var sampleData: Data {
        Data()
        
    }
    
    var task: Task {
        switch self {
        case .login(let cre):
            return .requestJSONEncodable(cre)
        case .register(let cre):
            return .requestJSONEncodable(cre)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
