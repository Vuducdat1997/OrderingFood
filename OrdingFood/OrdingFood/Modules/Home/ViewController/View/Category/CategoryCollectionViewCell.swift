//
//  CategoryCollectionViewCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        image.layer.cornerRadius = 4
    }

}
