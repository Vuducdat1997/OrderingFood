//
//  UIViewController+Extension.swift
//  OrdingFood
//
//  Created by Vu Dat on 16/12/2021.
//

import Foundation
import UIKit
import Photos

extension UIViewController {
    static func initFromNib() -> Self {
        return UIViewController.newFromNib(self)
    }
    
    private static func newFromNib<T: UIViewController>(_ controller: T.Type) -> T {
        let nibName = String(describing: T.self)
        return T(nibName: nibName, bundle: nil)
    }
    
    class func topViewController(controller: UIViewController? = AppDelegate.shared?.window?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    func pushToNibViewController<T: UIViewController>(_ controller: T.Type, animated: Bool = true, canPushItSelf: Bool = true, config: ((T)->Void)? = nil) {
        if !canPushItSelf {// check same Type
            if self.navigationController?.viewControllers.contains(where: {$0 is T}) ?? false {
                return
            }
        }
        let newInstant = T.initFromNib()
        config?(newInstant)
        navigationController?.pushViewController(newInstant, animated: animated)
    }
    
    func presentToNibViewController<T: UIViewController>(_ controller: T.Type, animated: Bool = true, config: ((T)->Void)? = nil) {
        let newInstant = T.initFromNib()
        config?(newInstant)
        
        present(newInstant, animated: false) {
            newInstant.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
            newInstant.presentationController?.presentedView?.gestureRecognizers?.first?.isEnabled = false
        }
    }
    
    func showNibPopup<T: UIViewController>(_ popup: T.Type, config: ((T)->Void)? = nil) {
        presentToNibViewController(popup, animated: false) { (vc) in
            config?(vc)
            vc.modalPresentationStyle = .overFullScreen
        }
    }
}


extension UIViewController {
    class func top() -> UIViewController? {
        return UIViewController.topViewControllerForRoot(rootViewController: UIApplication.shared.keyWindow?.rootViewController)
    }

    class func topForChat(rootViewController:UIViewController?) -> UIViewController? {
        guard let rootViewController = rootViewController else {
            return nil
        }

        guard let presented = rootViewController.presentedViewController else {
            switch rootViewController {
            case is UINavigationController:
                let navigationController:UINavigationController = rootViewController as! UINavigationController
                return navigationController.viewControllers.last

            case is UITabBarController:
                let tabBarController: UITabBarController = rootViewController as! UITabBarController
                return UIViewController.topForChat(rootViewController: tabBarController.selectedViewController)
            default:
                return rootViewController
            }
        }

        switch presented {
        case is UINavigationController:
            let navigationController:UINavigationController = presented as! UINavigationController
            return navigationController.viewControllers.last

        case is UITabBarController:
            let tabBarController: UITabBarController = presented as! UITabBarController
            return UIViewController.topForChat(rootViewController: tabBarController.selectedViewController)

        default:
            return presented
        }
    }

    
    class func topViewControllerForRoot(rootViewController:UIViewController?) -> UIViewController? {
        guard let rootViewController = rootViewController else {
            return nil
        }
        
        if rootViewController is UINavigationController {
            let navigationController:UINavigationController = rootViewController as! UINavigationController
            return UIViewController.topViewControllerForRoot(rootViewController: navigationController.viewControllers.last)
            
        } else if rootViewController is UITabBarController {
            let tabBarController:UITabBarController = rootViewController as! UITabBarController
            return UIViewController.topViewControllerForRoot(rootViewController: tabBarController.selectedViewController)
            
        } else if rootViewController.presentedViewController != nil {
            //            return rootViewController.presentedViewController
            return UIViewController.topViewControllerForRoot(rootViewController: rootViewController.presentedViewController)
        } else {
            return rootViewController
        }
    }
//
//    func embedInNavigationController() -> BaseNavi {
//        let navigationController = BaseNavi(rootViewController: self)
//        return navigationController
//    }

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = true
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}





