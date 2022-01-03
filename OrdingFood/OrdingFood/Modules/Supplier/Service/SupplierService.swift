//
//  SupplierService.swift
//  OrdingFood
//
//  Created by Vu Dat on 28/12/2021.
//

import Foundation

class SupplierService: NetworkService {
    
    func getSupplier(id: IdRequest, completion: @escaping (Result<SupplierResponse,BaseError>) -> Void) {
        client.request(MultiTarget(SupplierAPI.getSupplier(id: id)), type: SupplierResponse.self) {  result in
            completion(result)
        }
    }
}
