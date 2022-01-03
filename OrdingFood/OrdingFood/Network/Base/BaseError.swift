//
//  BaseError.swift
//  BSEM
//
//  Created by Tai Phan Van on 13/05/2021.
//

import Foundation

public enum BaseError: Error {
    case responseInvalid(title: String)
    case requestError(title: String, message: String)
    
    public var title: String {
        switch self {
        case .responseInvalid(let title):
            return title
        case .requestError(let title, _):
            return title
        }
    }
    
    public var description: String {
        switch self {
        case .responseInvalid:
            return "Response Invalid"
        case .requestError(_, let message):
            return message
        }
    }
}
