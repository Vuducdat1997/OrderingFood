//
//  NetworkClient.swift
//  BSEM
//
//  Created by Tai Phan Van on 13/05/2021.
//

import Foundation
import Moya

public typealias MultiTarget = Moya.MultiTarget

// Enable debug in scheme debug
#if DEBUG
var loggingEnabled: Bool = true
#else
var loggingEnabled: Bool = false
#endif

protocol NetworkingType {
    associatedtype Target: TargetType
    
    var router: NetworkProvider { get }
    
    static func defaultNetworking() -> Self
    static func stubbingNetworking() -> Self
}

// MARK: - NetworkClient
// The network layer for call API. we can use test with 'stubbingNetworking' or real API call with 'defaultNetworking'
public struct NetworkClient: NetworkingType {
    typealias Target = MultiTarget
    let router: NetworkProvider

    /// Default network  call
    static public func defaultNetworking() -> Self {
        return NetworkClient(router: newProvider(plugins))
    }

    /// testing network call
    static public func stubbingNetworking() -> Self {
        return NetworkClient(router: NetworkProvider(endpointClosure: endpointsClosure(),
                                                          requestClosure: NetworkClient.endpointResolver(), stubClosure: MoyaProvider.immediatelyStub, online: true))
    }

    /// actual request api function
    /// - Parameters:
    /// - T: Target API
    /// - type: type for encode
    /// - completion: return value from server
    public func request<T: Codable>(_ target: MultiTarget, type: T.Type, completion: @escaping (Result<T, BaseError>) -> Void) {
        let actualRequest: () = self.router.request(target, type: T.self, completion: completion)
        return actualRequest
    }

    /// actual request api function
    /// - Parameters:
    /// - T: Target API
    /// - completion: return value from server
    public func request(_ target: MultiTarget, completion: @escaping (Result<[String: Any], BaseError>) -> Void) {
        let actualRequest: () = self.router.request(target, completion: completion)
        return actualRequest
    }
}

extension NetworkingType {
    static func endpointsClosure<T>(_ xAccessToken: String? = nil) -> (T) -> Endpoint where T: TargetType {
        return { target in
            let endpoint = MoyaProvider.defaultEndpointMapping(for: target)
            // Sign all non-XApp, non-XAuth token requests
            return endpoint
        }
    }

    static func APIKeysBasedStubBehaviour<T>(_: T) -> Moya.StubBehavior {
        return .never
    }

    static var plugins: [PluginType] {
        var plugins: [PluginType] = []
        if loggingEnabled == true {
            plugins.append(NetworkLoggerPlugin())
        }
        return plugins
    }

    static func endpointResolver() -> MoyaProvider<Target>.RequestClosure {
        return { (endpoint, closure) in
            do {
                var request = try endpoint.urlRequest() // endpoint.urlRequest
                request.httpShouldHandleCookies = false
                closure(.success(request))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

private func newProvider(_ plugins: [PluginType], xAccessToken: String? = nil) -> NetworkProvider {
    return NetworkProvider(endpointClosure: NetworkClient.endpointsClosure(xAccessToken),
                          requestClosure: NetworkClient.endpointResolver(),
                          stubClosure: NetworkClient.APIKeysBasedStubBehaviour,
                          plugins: plugins)
}
