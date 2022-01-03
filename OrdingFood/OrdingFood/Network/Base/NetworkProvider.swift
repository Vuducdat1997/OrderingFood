//
//  NetworkProvider.swift
//  BSEM
//
//  Created by Tai Phan Van on 13/05/2021.
//

import Foundation
import Moya

// MARK: - NetworkProvider: make request
final class NetworkProvider {
    
    fileprivate let online: Bool
    fileprivate let provider: MoyaProvider<MultiTarget>
    
    init(endpointClosure: @escaping MoyaProvider<MultiTarget>.EndpointClosure = MoyaProvider<MultiTarget>.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<MultiTarget>.RequestClosure = MoyaProvider<MultiTarget>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<MultiTarget>.StubClosure = MoyaProvider<MultiTarget>.neverStub,
         session: Session = MoyaProvider<MultiTarget>.defaultAlamofireSession(),
         plugins: [PluginType] = [],
         trackInflights: Bool = false,
         online: Bool = true) {
        self.online = online
        self.provider = MoyaProvider(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, session: session, plugins: plugins, trackInflights: trackInflights)
    }
    
    /// Request api function  from the given components.
    ///
    /// - Parameters:
    ///     - target: Target API
    ///     - type:  type for encode
    ///     - completion: return value from server
    public func request<T: Codable>(_ target: MultiTarget, type: T.Type, completion: @escaping (Result<T, BaseError>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                NSLog("Response = \(response)")
                // When call api success
                if response.statusCode == 200 {
                    guard let results = try? JSONDecoder().decode(T.self, from: response.data) else {
                        // Decode error
                        DispatchQueue.main.async {
                            completion(.failure(BaseError.responseInvalid(title: target.path)))
                        }
                        return
                    }
                    DispatchQueue.main.async {
                        completion(.success(results))
                    }
                } else {
                    // When call API error
                    DispatchQueue.main.async {
                        let error = NSError(domain: target.path, code: response.statusCode, userInfo: nil)
                        completion(.failure(BaseError.requestError(title: target.path, message: error.localizedDescription)))
                    }
                }
            case .failure(let error):
                NSLog("error = \(error)")
                let error = NSError(domain: target.path, code: error.errorCode, userInfo: nil)
                DispatchQueue.main.async {
                    completion(.failure(BaseError.requestError(title: target.path, message: error.localizedDescription)))
                }
            }
        }
    }
    
    /// Request api function  from the given components.
    ///
    /// - Parameters:
    ///     - target: Target API
    ///     - completion: return value from server
    public func request(_ target: MultiTarget, completion: @escaping (Result<[String: Any], BaseError>) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    guard let dictionary = try? JSONSerialization.jsonObject(with: response.data, options: []) as? [String: Any] else {
                        DispatchQueue.main.async {
                            completion(.failure(BaseError.responseInvalid(title: target.path)))
                        }
                        return
                    }

                    DispatchQueue.main.async {
                        completion(.success(dictionary))
                    }
                } else {
                    DispatchQueue.main.async {
                        let error = NSError(domain: target.path, code: response.statusCode, userInfo: nil)
                        completion(.failure(BaseError.requestError(title: target.path, message: error.localizedDescription)))
                    }
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    completion(.failure(BaseError.requestError(title: target.path, message: error.localizedDescription)))
                }
            }
        }
    }
}
