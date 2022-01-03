//
//  AppRowCell.swift
//  AppStore
//
//  Created by Mahmoud Fares on 01/11/2021.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .purple
        imageView.image = UIImage(named: "faceBookicon")
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        
        let stackView = UIStackView(arrangedSubviews: [imageView, VerticalStackView(arrangedSubviews: [nameLabel], spacing: 4)])
        stackView.spacing = 16
        
        stackView.alignment = .center
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        stackView.layer.borderWidth = 0.1
        
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowRadius = 1
        stackView.layer.shadowOpacity = 0.5
        stackView.layer.shadowOffset = CGSize(width: 0, height: 0)
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
