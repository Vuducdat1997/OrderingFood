//
//  CategoryViewModel.swift
//  OrdingFood
//
//  Created by Vu Dat on 27/12/2021.
//


import Foundation

class CategoryViewModel {
    var categoryService = CategoryService()
    
    init(){
        
    }
    var responIsLoading: ((Bool) -> ())?
    var responseSuccess: ((String) -> ())?
    var responseFail: ((String) -> ())?
    
    func getAllCategory(completion: @escaping ([Category]?) -> ())  {
        responIsLoading?(true)
        
        categoryService.getAllCategory { [weak self] result in
            print(result)
            switch result {
            case .success(let respon):
                switch respon.success {
                case false:
                    completion(nil)
                    self?.responseFail?("Thất bại")
                case true:
                    completion(respon.productCategory)
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
