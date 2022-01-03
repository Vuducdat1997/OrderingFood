//
//  ProductOrderCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 30/12/2021.
//

import UIKit

class ProductOrderCell: UICollectionViewCell {
    
    let nameLabel = UILabel(text: "Tra sua chan chau", font: .systemFont(ofSize: 18, weight: .medium))
    let quantilyLabel = UILabel(text: "5x", font: .systemFont(ofSize: 12, weight: .thin))
    let priceLabel = UILabel(text: "20000", font: .systemFont(ofSize: 14))
    let imageView = UIImageView(cornerRadius: 8)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        
        imageView.backgroundColor = .darkGray
        imageView.image = UIImage(named: "ic_close")
        imageView.constrainWidth(constant: 16)
        imageView.constrainHeight(constant: 16)
        quantilyLabel.constrainWidth(constant: 20)
//        nameLabel.textAlignment = .right
        
        
        let stackView = UIStackView(arrangedSubviews: [quantilyLabel, nameLabel,priceLabel,imageView])
        stackView.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.layer.masksToBounds = true
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowRadius = 1
        stackView.layer.shadowOpacity = 0.5
        stackView.layer.shadowOffset = CGSize(width: 0, height: 0)
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
