//
//  BannerCollectionViewCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bannerImage.layer.cornerRadius = 10
    }

}
