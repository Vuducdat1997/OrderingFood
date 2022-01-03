//
//  AppsController.swift
//  AppStore
//
//  Created by Mahmoud Fares on 01/11/2021.
//

import UIKit

class AppsPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let categoryCell = "id"
    let popularCell = "id2"
    let productCell = "productCell"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarController?.tabBar.isHidden = false
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: categoryCell)
        collectionView.register(PopularCell.self, forCellWithReuseIdentifier: popularCell)
        collectionView.register(ProductRowCell.self, forCellWithReuseIdentifier: productCell)
        // 1
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.showsVerticalScrollIndicator = false
        self.view.layoutIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeViewCollectionView()
    }
    
    func changeViewCollectionView() {
        
    }
    
    
    // 2
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    // 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 180)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCell, for: indexPath)
        if indexPath.row == 1 {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: popularCell, for: indexPath)
            return cell2
        }else if indexPath.row == 2{
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: productCell, for: indexPath)
            return cell3
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 2 {
            return .init(width: view.frame.width, height: 300)
        }
        return .init(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}


