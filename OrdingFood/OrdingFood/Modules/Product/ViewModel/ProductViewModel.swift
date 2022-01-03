//
//  ProductViewModel.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import Foundation

class ProductViewModel {
    var productService = ProductService()
    
    init(){
        
    }
    var responIsLoading: ((Bool) -> ())?
    var responseSuccess: ((String) -> ())?
    var responseFail: ((String) -> ())?
    
    func getAllProduct(completion: @escaping ([Product]?) -> ())  {
        responIsLoading?(true)
        
        productService.getAllProduct { [weak self] result in
            print(result)
            switch result {
            case .success(let respon):
                switch respon.success {
                case false:
                    completion(nil)
                    self?.responseFail?("Thất bại")
                case true:
                    completion(respon.product)
                    self?.responseSuccess?("Thành công")
                default:
                    completion(nil)
                    self?.responseFail?("Thất bại")
                }
            case .failure:
                completion(nil)
                self?.responseFail?("Thất bại")
            }
            self?.responIsLoading?(false)
        }
    }
    
    func getProductPopular(completion: @escaping ([Product]?) -> ())  {
        responIsLoading?(true)
        
        productService.getProductPopular { [weak self] result in
            print(result)
            switch result {
            case .success(let respon):
                switch respon.success {
                case false:
                    completion(nil)
                    self?.responseFail?("Thất bại")
                case true:
                    completion(respon.product)
                    self?.responseSuccess?("Thành công")
                default:
                    completion(nil)
                    self?.responseFail?("Thất bại")
                }
            case .failure:
                completion(nil)
                self?.responseFail?("Thất bại")
            }
            self?.responIsLoading?(false)
        }
    }
}
