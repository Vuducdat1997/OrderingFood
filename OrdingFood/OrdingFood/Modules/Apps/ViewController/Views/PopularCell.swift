//
//  PopularCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 22/12/2021.
//

import Foundation
import UIKit

class PopularCell : UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Popular Section", font: .boldSystemFont(ofSize: 30))
    let allButton = UIButton(title: "Xem thêm ->")
    let horizontalController = PopularHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupAction()
    }
    
    func setupView() {
        allButton.tintColor = .darkGray
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(allButton)
        allButton.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 0, right: 4))
        
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    func setupAction() {
        allButton.addTarget(self, action: #selector(allClick(_:)), for: .touchUpInside)
        
    }
    
    @objc func allClick(_ sender: UIButton) {
        print("AllClick")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
