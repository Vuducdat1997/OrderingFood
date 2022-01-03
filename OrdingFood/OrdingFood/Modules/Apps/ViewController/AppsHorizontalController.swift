//
//  AppsHorizontalController.swift
//  AppStore
//
//  Created by Mahmoud Fares on 01/11/2021.
//
//

import UIKit
import Nuke

class AppsHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var categoryVM : CategoryViewModel!
    var data = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryVM = CategoryViewModel()
        setupCollectionView()
        fetchData()
    }
    
    func fetchData() {
        categoryVM.getAllCategory { result in
            guard let result = result else {
                return
            }
            self.data = result
            self.collectionView.reloadData()
        }
        categoryVM.responseFail = { result in
            print(result)
        }
    }
    
    private func setupCollectionView() {
        
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppRowCell
        cell.nameLabel.text = data[indexPath.row].name!
        let url : URL = URL(string: data[indexPath.row].urlIcon!)!
        Nuke.loadImage(with: url, into: cell.imageView)
        
        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 2
        return .init(width: (view.frame.width - 40)/2, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 16, bottom: topBottomPadding, right: 16)
    }
    
}
