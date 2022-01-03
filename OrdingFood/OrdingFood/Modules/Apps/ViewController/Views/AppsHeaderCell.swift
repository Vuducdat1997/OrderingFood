//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Mahmoud Fares on 01/11/2021.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    


    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "FacebookWallpaper")
        
        let stackView = VerticalStackView(arrangedSubviews: [
            imageView
            ], spacing: 12)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
