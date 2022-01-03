//
//  SupplierViewModel.swift
//  OrdingFood
//
//  Created by Vu Dat on 28/12/2021.
//

import Foundation
class SupplierViewModel {
    var supplierService = SupplierService()
    
    init(){
        
    }
    var responIsLoading: ((Bool) -> ())?
    var responseSuccess: ((String) -> ())?
    var responseFail: ((String) -> ())?
    
    func getSupplier(id: IdRequest,completion: @escaping (SupplierResponse?) -> ())  {
        responIsLoading?(true)
        
        supplierService.getSupplier(id: id) { [weak self] result in
            print(result)
            switch result {
            case .success(let respon):
                switch respon.success {
                case false:
                    completion(nil)
                    self?.responseFail?("Thất bại")
                case true:
                    completion(respon)
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
