//
//  ProductService.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import Foundation
import AVFoundation

class ProductService: NetworkService {
    
    func getAllProduct(completion: @escaping (Result<ProductResponse,BaseError>) -> Void) {
        client.request(MultiTarget(ProductAPI.getAllProduct), type: ProductResponse.self) {  result in
            completion(result)
        }
    }
    
    func getProductPopular(completion: @escaping (Result<ProductResponse,BaseError>) -> Void) {
        client.request(MultiTarget(ProductAPI.getPoroductPopular), type: ProductResponse.self) {  result in
            completion(result)
        }
    }
    
}
