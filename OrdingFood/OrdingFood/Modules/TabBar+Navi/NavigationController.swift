//
//  Navicontroller.swift
//  OrdingFood
//
//  Created by Vu Dat on 24/12/2021.
//

import Foundation
import UIKit

final class NavigationController: UINavigationController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - UI
    func setupUI() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.backgroundColor = UIColor.Navigation.background
        appearance.shadowColor = .clear
        
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        
        navigationBar.shadowImage = UIImage()
        navigationBar.barTintColor = UIColor.Navigation.background
        navigationBar.isTranslucent = false
    }
}
