//
//  SearchViewController.swift
//  OrdingFood
//
//  Created by Vu Dat on 01/01/2022.
//

import UIKit

class SearchViewController: BaseViewController, UITextFieldDelegate {
    let productId = "productcell"
    @IBOutlet weak var searchTextField: TextFieldSearch!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var productsView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = title
        setupView()
        setupViewProduct()
    }
    
    func setupView() {
        searchTextField.delegate = self
        
        let productNib = UINib(nibName: "ProductCollectionViewCell", bundle: .main)
        productsView.register(productNib, forCellWithReuseIdentifier: productId)
    }
    func setupViewProduct() {
        let screenWidth = UIScreen.main.bounds.width - 40
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 24, bottom: 4, right: 24)
        layout.itemSize = CGSize(width: screenWidth, height: 100)
        layout.minimumInteritemSpacing = 24
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        layout.collectionView?.showsHorizontalScrollIndicator = false
        productsView.collectionViewLayout = layout
    }
    // MARK: - Init
    init(title: String?){
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @IBAction func searchClick(_ sender: Any) {
        
    }
}

extension SearchViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productsView.dequeueReusableCell(withReuseIdentifier: productId, for: indexPath)
        return cell
    }
    
    
}
