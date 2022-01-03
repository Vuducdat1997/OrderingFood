//
//  ProductViewController.swift
//  OrdingFood
//
//  Created by Vu Dat on 20/12/2021.
//

import UIKit

class ProductViewController: BaseViewController {
    let productId = "productcell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data : [Product] = []
    var titleLable = "Product"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = titleLable
        navigationController?.tabBarController?.tabBar.isHidden = true
        let productNib = UINib(nibName: "ProductCollectionViewCell", bundle: .main)
        collectionView.register(productNib, forCellWithReuseIdentifier: productId)
        setupViewProduct()
    }
    
    func setupViewProduct() {
        let screenWidth = UIScreen.main.bounds.width - 40
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 24, bottom: 4, right: 24)
        layout.itemSize = CGSize(width: screenWidth, height: 100)
        layout.minimumInteritemSpacing = 24
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        layout.collectionView?.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
    }
}
extension ProductViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productId, for: indexPath) as! ProductCollectionViewCell
        
        cell.image.backgroundColor = .blue
        cell.title.text = data[indexPath.row].title
        cell.name.text = data[indexPath.row].name
        cell.price.text = data[indexPath.row].price
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(data[indexPath.row].supplierId)
        pushToNibViewController(SupperlierViewController.self)
    }
    
}
