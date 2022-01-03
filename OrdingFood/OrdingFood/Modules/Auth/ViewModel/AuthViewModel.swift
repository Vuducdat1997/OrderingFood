//
//  AuthViewModel.swift
//  OrdingFood
//
//  Created by macbook on 13/12/2021.
//

import Foundation

class AuthViewModel {
    var authService = AuthService()
    var cre : UserCredential
    
    
    init(cre : UserCredential) {
        self.cre = cre
    }
    
    var responIsLoading: ((Bool) -> ())?
    var responseSuccess: ((String) -> ())?
    var responseFail: ((String) -> ())?
    
    func login(completion: @escaping (LoginResponse?) -> ())  {
        responIsLoading?(true)
        
        authService.login(user: cre) { [weak self] result in
            print("Datvd \(result)")
            switch result {
            case .success(let respon):
                switch respon.success {
                case false:
                    completion(nil)
                    self?.responseFail?("Đăng nhập thất bại")
                case true:
                    completion(respon)
                    self?.responseSuccess?("Đăng nhập thành công")
                default:
                    completion(nil)
                    self?.responseFail?("Đăng nhập thất bại")
                }
            case .failure:
                completion(nil)
                self?.responseFail?("Đăng nhập thất bại")
            }
            self?.responIsLoading?(false)
        }
    }
}
	
