//
//  BannerViewModel.swift
//  OrdingFood
//
//  Created by Vu Dat on 26/12/2021.
//

import Foundation

class BannerViewModel {
    var bannerService = BannerService()
    
    init(){
        
    }
    var responIsLoading: ((Bool) -> ())?
    var responseSuccess: ((String) -> ())?
    var responseFail: ((String) -> ())?
    
    func getAllBanner(completion: @escaping ([BannerApp]?) -> ())  {
        responIsLoading?(true)
        
        bannerService.getAllBanner { [weak self] result in
            print(result)
            switch result {
            case .success(let respon):
                switch respon.success {
                case false:
                    completion(nil)
                    self?.responseFail?("Thất bại")
                case true:
                    completion(respon.banner)
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
