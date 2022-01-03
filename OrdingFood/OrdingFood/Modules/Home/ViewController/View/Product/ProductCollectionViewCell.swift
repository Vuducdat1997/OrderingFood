//
//  ProductCollectionViewCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewContent.layer.borderWidth = 0.3
        viewContent.layer.borderColor = UIColor.lightGray.cgColor
        viewContent.layer.cornerRadius = 4
        
        viewContent.layer.masksToBounds = true
        viewContent.layer.shadowColor = UIColor.black.cgColor
        viewContent.layer.shadowRadius = 1
        viewContent.layer.shadowOpacity = 0.5
        viewContent.layer.shadowOffset = CGSize(width: 0, height: 0)
    }

}
