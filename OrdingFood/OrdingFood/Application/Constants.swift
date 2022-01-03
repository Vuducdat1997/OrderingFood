//
//  Constants.swift
//  OrdingFood
//
//  Created by Vu Dat on 02/01/2022.
//

import Foundation

extension UserDefaults {
  enum Keys {
        
    // check first login
    static let FIRST_LOGIN_APP = "FIRST_LOGIN_APP"
      
    //Check is login
    static let IS_LOGIN_APP = "IS_LOGIN_APP"
      
    // check permission access
    static let ACCESS_TOKEN = "ACCESS_TOKEN"
    
    // array account
    static let ACCOUNT_LOGIN: String = "AccountLogin"
      
      //cart data
      static let CART_DATA_APP = "CART_DATA_APP"
    
  }
}
