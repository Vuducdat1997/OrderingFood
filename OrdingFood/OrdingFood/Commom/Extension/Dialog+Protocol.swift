//
//  Dialog+Protocol.swift
//  OrdingFood
//
//  Created by Vu Dat on 31/12/2021.
//

import Foundation
import UIKit

protocol CustomDialogNew {
    func show(animated: Bool)
    func dimiss(animated: Bool)
    var backgroundView: UIView { get }
    var dialogView: UIView { get set }
}

extension CustomDialogNew where Self: UIView {
    func show(animated: Bool) {
        self.backgroundView.alpha = 0
        self.backgroundView.backgroundColor = .black
        self.dialogView.center = CGPoint(x: self.center.x, y: self.frame.height + self.dialogView.frame.height/2)
        UIApplication.shared.delegate?.window??.rootViewController?.view.addSubview(self)
        if animated {
            UIView.animate(withDuration: 0.33, animations: {
                self.backgroundView.alpha = 0.7
            })
            UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIView.AnimationOptions(rawValue: 0), animations: {
                self.dialogView.center  = self.center
            }, completion: { (completed) in

            })
        } else {
            self.backgroundView.alpha = 0.7
            self.dialogView.center  = self.center
        }
    }
    
    func dismiss(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.33, animations: {
                self.backgroundView.alpha = 0
            }, completion: { (completed) in
                
            })
            UIView.animate(withDuration: 0.33, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 10, options: UIView.AnimationOptions(rawValue: 0), animations: {
                self.dialogView.center = CGPoint(x: self.center.x, y: self.frame.height + self.dialogView.frame.height/2)
            }, completion: { (completed) in
                self.removeFromSuperview()
            })
        } else {
            self.removeFromSuperview()
        }
    }
}
