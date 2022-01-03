//
//  ProductPopularCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 22/12/2021.
//

import UIKit

class ProductPopularCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    
    let nameLabel = UILabel(text: "Banh My Ba DInh Ha Noi", font: .systemFont(ofSize: 24, weight: .bold))
    let priceLabel = UILabel(text: "50.000đ", font: .systemFont(ofSize: 16, weight: .thin))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "faceBookicon")
        imageView.constrainWidth(constant: 120)
        imageView.constrainHeight(constant: 120)
        nameLabel.numberOfLines = 0
        priceLabel.textColor = .orange
        
        let stackView = UIStackView(arrangedSubviews: [imageView,VerticalStackView(arrangedSubviews: [nameLabel,priceLabel], spacing: 30)] )
        stackView.spacing = 16
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
