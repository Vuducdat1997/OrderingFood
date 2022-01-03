//
//  CategoryService.swift
//  OrdingFood
//
//  Created by Vu Dat on 27/12/2021.
//

import Foundation
import AVFoundation

class CategoryService: NetworkService {
    
    func getAllCategory(completion: @escaping (Result<CategoryResponse,BaseError>) -> Void) {
        client.request(MultiTarget(CategoryAPI.getCategoryApp), type: CategoryResponse.self) {  result in
            completion(result)
        }
    }
    
}
