//
//  CartViewCell.swift
//  OrdingFood
//
//  Created by Vu Dat on 01/01/2022.
//

import UIKit

class CartViewCell: UITableViewCell {

    @IBOutlet weak var supplierNameLabel: UILabel!
    @IBOutlet weak var quantilyProductLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
