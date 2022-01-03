//
//  AlertView.swift
//  OrdingFood
//
//  Created by Vu Dat on 31/12/2021.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    static let instance = AlertView()
    
    @IBOutlet var presentView: UIView!
    @IBOutlet weak var alertView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func showAlert() {
        UIApplication.shared.windows
    }
    
}

