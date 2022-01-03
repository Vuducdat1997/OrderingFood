//
//  PopularCollectionViewCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 8
        view.backgroundColor = .link
        image.layer.cornerRadius = 5
    }

}
