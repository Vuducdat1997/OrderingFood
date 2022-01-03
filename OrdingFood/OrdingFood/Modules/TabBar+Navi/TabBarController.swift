//
//  File.swift
//  OrdingFood
//
//  Created by Vu Dat on 24/12/2021.
//

import Foundation
import CardTabBar

class TabBarController: CardTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewController()
    }
    
    func setupUI() {
            tabBar.tintColor = .TabBar.title
            tabBar.backgroundColor = .background
            tabBar.barTintColor = .Navigation.background
            tabBar.indicatorColor = .TabBar.itemBackground
    }
    
    func setupViewController() {
        viewControllers = [homeTab, bookTab,notificationTab, profileTab]
    }
    
    // MARK: - TabItems
       lazy var homeTab: UIViewController = {
           let homeTabItem = UITabBarItem(title: "Home", image: UIImage(named: "ic_home"), selectedImage: nil)
           let layout = UICollectionViewFlowLayout()
           let vc = AppsPageController(collectionViewLayout: layout) 
           let homeNavTab = NavigationController(rootViewController: vc)
           homeNavTab.tabBarItem = homeTabItem
           return homeNavTab
       }()

       lazy var bookTab: UIViewController = {
           let searchTabItem = UITabBarItem(title: "Search", image: UIImage(named: "ic_search"), selectedImage: nil)
           let navController = NavigationController(rootViewController: SearchViewController(title: "Tìm kiếm"))
           navController.tabBarItem = searchTabItem
           return navController
       }()

       lazy var profileTab: UIViewController = {
           let randomTabItem = UITabBarItem(title: "Profile", image: UIImage(named: "ic_profile"), selectedImage: nil)
           let navController = NavigationController(rootViewController: ProfileVC(title: "Trang cá nhân"))
           navController.tabBarItem = randomTabItem
           return navController
       }()

       lazy var notificationTab: UIViewController = {
           let commentTabItem = UITabBarItem(title: "Cart", image: UIImage(named: "icons8-shopping-cart-24"), selectedImage: nil)
           let navController = NavigationController(rootViewController: CartVC(title: "Giỏ hàng"))
           navController.tabBarItem = commentTabItem
           
           return navController
       }()

}
