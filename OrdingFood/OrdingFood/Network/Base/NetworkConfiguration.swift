//
//  NetworkConfiguration.swift
//  BSEM
//
//  Created by Tai Phan Van on 13/05/2021.
//

import Foundation

struct NetworkConfiguration {
    // set true for tests and generating screenshots with fastlane
    public static let useStaging = false
    #if DEBUG
    public static let baseUrl = "baseUrl"
    #else
    public static let baseUrl = "baseUrl"
    #endif
}
