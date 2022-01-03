//
//  AuthService.swift
//  OrdingFood
//
//  Created by macbook on 13/12/2021.
//

import Foundation
import AVFoundation

class AuthService: NetworkService {
    
    func login(user: UserCredential, completion: @escaping (Result<LoginResponse,BaseError>) -> Void) {
        client.request(MultiTarget(AuthAPI.login(cre: user)), type: LoginResponse.self) {  result in
            completion(result)
        }
    }
    
    func register(register: RegisterCredential, completion: @escaping (Result<LoginResponse,BaseError>) -> Void) {
        client.request(MultiTarget(AuthAPI.register(cre: register)), type: LoginResponse.self) { result in
            completion(result)
        }
    }
}
