//
//  BannerService.swift
//  OrdingFood
//
//  Created by Vu Dat on 26/12/2021.
//

import Foundation

import AVFoundation

class BannerService: NetworkService {
    
    func getAllBanner(completion: @escaping (Result<BannerResponse,BaseError>) -> Void) {
        client.request(MultiTarget(BannerAPI.getBanner), type: BannerResponse.self) {  result in
            completion(result)
        }
    }
    
}
