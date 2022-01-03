//
//  HomeViewController.swift
//  OrdingFood
//
//  Created by Vu Dat on 16/12/2021.
//

import UIKit

class HomeViewController: UIViewController {

    let bannerId = "bannercell"
    let categoryId = "categorycell"
    let popularId = "popularcell"
    let productId = "productcell"
    
    var productViewModel : ProductViewModel!
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularProductCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var scollView: UIScrollView!
    
    @IBOutlet weak var productHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        setupview()
        scollView.setContentOffset(.zero, animated: true)
        self.view.layoutIfNeeded()
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.changeColletionHeight()
    }
    
    func setUpCollectionView(){
        let bannerNib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        bannerCollectionView.register(bannerNib, forCellWithReuseIdentifier: bannerId)
        
        let categoryNib = UINib(nibName: "CategoryCollectionViewCell", bundle: nil)
        categoryCollectionView.register(categoryNib, forCellWithReuseIdentifier: categoryId)
        
        let popularNib = UINib(nibName: "PopularCollectionViewCell", bundle: nil)
        popularProductCollectionView.register(popularNib, forCellWithReuseIdentifier: popularId)
        
        let productNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        productCollectionView.register(productNib, forCellWithReuseIdentifier: productId)
    }
    
    func setupview() {
        setupViewBanner()
        setupCategory()
        setupPopular()
        setupViewProduct()
        setupNavBar()
    }
    
    @IBAction func popularAllClick(_ sender: Any) {
//        productViewModel = ProductViewModel()
//        let productView = ProductViewController(nibName: nil, bundle: nil)
//        productViewModel.getAllProduct { result in
//            guard let result = result else {return}
//            productView.data = result
//            self.navigationController?.pushViewController(productView, animated: true)
//        }
    }
    
    @IBAction func allProductClick(_ sender: Any) {
        productViewModel = ProductViewModel()
        let productView = ProductViewController(nibName: nil, bundle: nil)
        productViewModel.getAllProduct { result in
            guard let result = result else {return}
            productView.data = result
            self.navigationController?.pushViewController(productView, animated: true)
        }
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
        productCollectionView.collectionViewLayout = layout
    }
    
    func setupViewBanner() {
        let screenWidth = UIScreen.main.bounds.width - 40
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 24, bottom: 4, right: 24)
        layout.itemSize = CGSize(width: screenWidth, height: 120)
        layout.minimumInteritemSpacing = 24
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        layout.collectionView?.showsHorizontalScrollIndicator = false
        bannerCollectionView.collectionViewLayout = layout
    }
    
    func setupCategory() {
        let screenWidth = UIScreen.main.bounds.width/2-20
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        layout.itemSize = CGSize(width: screenWidth, height: 64)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        layout.collectionView?.showsHorizontalScrollIndicator = false
        categoryCollectionView.collectionViewLayout = layout
    }
    
    func setupPopular() {
        let height = popularProductCollectionView.bounds.height - 4
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 24, bottom: 1, right: 24)
        layout.itemSize = CGSize(width: 164, height: height)
        layout.minimumInteritemSpacing = 24
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        layout.collectionView?.showsHorizontalScrollIndicator = false
        popularProductCollectionView.collectionViewLayout = layout
    }
    
    func setupNavBar() {
        self.title = "FOOD"
        let rightButton = CartButtonBage()
        rightButton.frame = CGRect(x: 20, y: 20, width: 20, height: 20)
        rightButton.setImage(UIImage(named: "twitter")?.withRenderingMode(.automatic), for: .normal)
        rightButton.imageView?.backgroundColor = .systemBackground
        rightButton.badgeEdgeInsets = UIEdgeInsets(top: 10, left: 7, bottom: 0, right: 0)
        rightButton.badge = "0"
        navigationController?.navigationBar.addSubview(rightButton)
        rightButton.tag = 1
        rightButton.frame = CGRect(x: self.view.frame.width, y: 0, width: 120, height: 20)

        let targetView = self.navigationController?.navigationBar

        let trailingContraint = NSLayoutConstraint(item: rightButton, attribute:
            .trailingMargin, relatedBy: .equal, toItem: targetView,
                             attribute: .trailingMargin, multiplier: 1.0, constant: -16)
        let bottomConstraint = NSLayoutConstraint(item: rightButton, attribute: .bottom, relatedBy: .equal,
                                        toItem: targetView, attribute: .bottom, multiplier: 1.0, constant: -6)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([trailingContraint, bottomConstraint])

    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func changeColletionHeight() {
        self.productHeight.constant = self.productCollectionView.contentSize.height
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == categoryCollectionView) {
            return 10
        }
        
        if (collectionView == popularProductCollectionView) {
            return 10
        }
        
        if (collectionView == productCollectionView) {
            return 10
        }

        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: bannerId, for: indexPath) as! BannerCollectionViewCell
        cell.bannerImage.backgroundColor = .blue
        
        if (collectionView == categoryCollectionView) {
            let cell2 = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: categoryId, for: indexPath) as! CategoryCollectionViewCell
            cell2.image.backgroundColor = .red
            cell2.name.text = "Icon"
        return cell2
        }else if (collectionView == popularProductCollectionView) {
            let cell3 = popularProductCollectionView.dequeueReusableCell(withReuseIdentifier: popularId, for: indexPath) as! PopularCollectionViewCell
            cell3.image.backgroundColor = .green
            cell3.title.text = "Title"
            cell3.name.text = "Name"
            cell3.price.text = "30.000 VND"
        return cell3
        } else if(collectionView == productCollectionView) {
            let cell4 = productCollectionView.dequeueReusableCell(withReuseIdentifier: productId, for: indexPath) as! ProductCollectionViewCell
            cell4.image.backgroundColor = .blue
            cell4.title.text = "Title"
            cell4.name.text = "Name"
            cell4.price.text = "30.000 VND"
            return cell4
        }
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == categoryCollectionView) {
            print("categoryCollectionView \(indexPath)")
        }
        
        if (collectionView == popularProductCollectionView) {
            print("popularProductCollectionView \(indexPath)")
        }
        
        if (collectionView == productCollectionView) {
            print("popularProductCollectionView \(indexPath)")
        }
        
        if (collectionView == bannerCollectionView) {
            print("bannerCollectionView \(indexPath)")
        }

    }

}

