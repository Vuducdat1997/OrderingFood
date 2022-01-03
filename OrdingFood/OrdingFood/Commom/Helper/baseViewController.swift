//
//  baseViewController.swift
//  AppStore
//
//  Created by Mahmoud Fares on 01/11/2021.
//

import UIKit
class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

