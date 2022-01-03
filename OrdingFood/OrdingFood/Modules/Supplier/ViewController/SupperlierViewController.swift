//
//  SupperlierViewController.swift
//  OrdingFood
//
//  Created by Vu Dat on 21/12/2021.
//

import UIKit
import Nuke
class SupperlierViewController: UIViewController {

    let productId = "suppliercell"
    
    var dataView = SupplierResponse()
    var dataSupplier : Supplier!
    var dataProduct : [Product] = []
    var supplierVM: SupplierViewModel!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var supplierView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var productCollectionView: UICollectionView!

    @IBOutlet weak var collectionHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        productCollectionView.register(UINib(nibName: "SupplierProductCell", bundle: nil), forCellWithReuseIdentifier: productId)
        title = "Cửa hàng"
        self.view.layoutIfNeeded()
    }
    
//    override func viewDidLayoutSubviews() {
//        self.changeCollectionView()
//    }

    func setupView() {
        supplierView.layer.cornerRadius = 10
        supplierView.layer.borderWidth = 0.5
        supplierView.layer.masksToBounds = false
        supplierView.layer.shadowRadius = 10
        supplierView.layer.shadowOffset = .zero
        supplierView.layer.shadowOpacity = 0.5
        supplierView.layer.shadowColor = UIColor.black.cgColor
        
        let urlBanner : URL = URL(string: dataSupplier.bannerUrl!)!
        Nuke.loadImage(with: urlBanner, into: bannerImage)
        guard let title = dataSupplier.title, let address = dataSupplier.address else {return}
        titleLabel.text = title
        addressLabel.text = "Địa chỉ: \(address)"
    }
}

extension SupperlierViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func changeCollectionView() {
//        self.collectionHeight.constant = self.productCollectionView.contentSize.height
//    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: (view.frame.width - 40), height: 116)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productCollectionView.dequeueReusableCell(withReuseIdentifier: productId, for: indexPath) as! SupplierProductCell
        cell.nameLabel.text = dataProduct[indexPath.row].title
        cell.priceLabel.text = dataProduct[indexPath.row].price
        let url : URL = URL(string: dataProduct[indexPath.row].url!)!
        Nuke.loadImage(with: url, into: cell.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let vc = OrderProductVC()
        vc.data = dataProduct[indexPath.row]
        vc.nameSupplier = dataSupplier.title!
        present(vc, animated: true, completion: nil)
    }
    
}
