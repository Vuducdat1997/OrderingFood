//
//  NetworkService.swift
//  BSEM
//
//  Created by Tai Phan Van on 13/05/2021.
//

import Foundation

class NetworkService {
    var client: NetworkClient!
    
    public init(isTest: Bool = false) {
        client = isTest ? NetworkClient.stubbingNetworking() : NetworkClient.defaultNetworking()
    }
}
