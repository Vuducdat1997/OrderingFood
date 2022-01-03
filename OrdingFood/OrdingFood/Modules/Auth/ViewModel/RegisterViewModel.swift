//
//  RegisterViewModel.swift
//  OrdingFood
//
//  Created by Vu Dat on 02/01/2022.
//

import Foundation
class RegisterViewModel {
    var authService = AuthService()
    var register : RegisterCredential
    
    
    init(cre : RegisterCredential) {
        self.register = cre
    }
    
    var responIsLoading: ((Bool) -> ())?
    var responseSuccess: ((String) -> ())?
    var responseFail: ((String) -> ())?
    
    func register(completion: @escaping (LoginResponse?) -> ())  {
        responIsLoading?(true)
        
        authService.register(register: register) { [weak self] result in
            print("Datvd \(result)")
            switch result {
            case .success(let respon):
                switch respon.success {
                case false:
                    completion(nil)
                    self?.responseFail?("Đăng Ký thất bại")
                case true:
                    completion(respon)
                    self?.responseSuccess?("Đăng ký thành công")
                default:
                    completion(nil)
                    self?.responseFail?("Đăng Ký thất bại")
                }
            case .failure:
                completion(nil)
                self?.responseFail?("Đăng Ký thất bại")
            }
            self?.responIsLoading?(false)
        }
    }
}
