//
//  AppsHeaderHorizontalController.swift
//  AppStore
//
//  Created by Mahmoud Fares on 01/11/2021.
//
//

import UIKit
import Nuke

class AppsHeaderHorizontalController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var supplierVM: SupplierViewModel!
    var bannerViewModel: BannerViewModel!
    var data = [BannerApp]()
    override func viewDidLoad() {
        super.viewDidLoad()
        supplierVM = SupplierViewModel()
        bannerViewModel = BannerViewModel()
        setupCollectionView()
        
        fetchData()
            }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    func fetchData() {
        bannerViewModel.getAllBanner { result in
            guard let result = result else {
                print("Datvd False")
                return
            }
            self.data = result
            self.collectionView.reloadData()
        }
        bannerViewModel.responseFail = { result in
            print(result)
        }
    }
    
    private func setupCollectionView() {
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal    
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderCell
        let url : URL = URL(string: data[indexPath.row].imageUrl!)!
        Nuke.loadImage(with: url, into: cell.imageView)
        return cell
    }
 
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Banner")
        
        let id = IdRequest(id: data[indexPath.row].supplierId)
        supplierVM.getSupplier(id: id) { result in
            guard let result = result else {
                return
            }
            
            UIViewController.top()?.pushToNibViewController(SupperlierViewController.self, animated: true, canPushItSelf: true) { vc in
                vc.dataProduct = result.product!
                vc.dataSupplier = result.supplier!
            }
        }
       
    }
    
}
