//
//  BaseViewController.swift
//  OrdingFood
//
//  Created by Vu Dat on 31/12/2021.
//

import UIKit
import HHFloatingView
import Floaty

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        addFloatingView()
    }
    
    func setUpFloatyView() {
        let floaty = Floaty()
        
        floaty.addItem(title: "Them Mon") { item in
            item.icon = UIImage(named: "edit")
        }
        self.view.addSubview(floaty)
    }
    //Initialize HHFloatingView
    fileprivate var floatingView: HHFloatingView = {
        let floatingViewSize: CGFloat = 100.0
        let padding: CGFloat = 10.0
        let hhfv = HHFloatingView.init(frame: CGRect.init(origin: CGPoint.init(x: UIScreen.main.bounds.size.width - (floatingViewSize + padding), y: UIScreen.main.bounds.size.height/2), size: CGSize.init(width: floatingViewSize, height: floatingViewSize)))
        return hhfv
    }()
    
    //MARK: Add Floating View.
    internal func addFloatingView() {
        floatingView.delegate = self
        floatingView.datasource = self
        view.addSubview(floatingView)
        floatingView.reload()
        
    }

}

//MARK: HHFloatingViewDatasource
extension BaseViewController: HHFloatingViewDatasource {
    func floatingViewConfiguration(floatingView: HHFloatingView) -> HHFloatingViewConfiguration {
        let configure = HHFloatingViewConfiguration.init()
        configure.animationTimerDuration = 0.3
        configure.internalAnimationTimerDuration = 0.2
        configure.handlerImage = #imageLiteral(resourceName: "mosque")
        configure.handlerSize = CGSize.init(width: 90.0, height: 90.0)
        configure.handlerColor = UIColor.blue.withAlphaComponent(0.5)
        configure.optionsDisplayDirection = .top
        configure.numberOfOptions = 3
        configure.optionsSize = CGSize.init(width: 60.0, height: 60.0)
        configure.initialMargin = 10
        configure.internalMargin = 10.0
        configure.optionImages = [#imageLiteral(resourceName: "calendar"), #imageLiteral(resourceName: "ic_settings"), #imageLiteral(resourceName: "bell")]
        configure.optionColors = [UIColor.blue.withAlphaComponent(0.5),
                                  UIColor.cyan.withAlphaComponent(0.5),
                                  UIColor.magenta.withAlphaComponent(0.5)]
        configure.showShadowInHandlerButton = true
        configure.showShadowInButtons = true
        configure.isDraggable = false
        return configure
    }
}

//MARK: HHFloatingViewDelegate
extension BaseViewController: HHFloatingViewDelegate {
    func floatingView(floatingView: HHFloatingView, didSelectOption index: Int) {
        print("HHFloatingView: Button Selected: \(index)")
        floatingView.close()
    }
    
    func floatingView(floatingView: HHFloatingView, didTapHandler isOpening: Bool) {
        print("HHFloatingView Open View")
    }
}
