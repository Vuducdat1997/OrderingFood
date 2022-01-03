//
//  PopularHorizontalController.swift
//  OrdingFood
//
//  Created by Vu Dat on 22/12/2021.
//

import UIKit
import Nuke

private let reuseIdentifier = "Cell"

class PopularHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {

    var data = [Product]()
    var productVM : ProductViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        productVM = ProductViewModel()
        // Register cell classes
        collectionView!.register(ProductPopularCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    func fetchData() {
        productVM.getProductPopular { result in
            guard let result = result else {
                return
            }
            
            self.data = result
            self.collectionView.reloadData()
        }
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return data.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductPopularCell
        cell.nameLabel.text = data[indexPath.row].title
        cell.priceLabel.text = data[indexPath.row].price
        let url : URL = URL(string: data[indexPath.row].url!)!
        Nuke.loadImage(with: url, into: cell.imageView)
        // Configure the cell
        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing)
        return .init(width: (view.frame.width - 40), height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(data[indexPath.row])
    
    }
    

}
