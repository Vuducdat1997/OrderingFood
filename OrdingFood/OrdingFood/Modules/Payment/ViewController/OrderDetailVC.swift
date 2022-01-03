//
//  OrderDetailVC.swift
//  OrdingFood
//
//  Created by Vu Dat on 22/12/2021.
//

import UIKit

class OrderDetailVC: UIViewController,UICollectionViewDelegateFlowLayout {

    let cellId = "productOrderCellId"
    @IBOutlet weak var addressUserLabel: UILabel!
    @IBOutlet weak var listProductCV: UICollectionView!
    
    @IBOutlet weak var quantilyLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var priceShipLabel: UILabel!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var priceTotalLabel: UILabel!
    
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint!
    
    var cart :Cart!
    var orderDetails : [OrderDetail]!
    var shiperPrice = 15000
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trang thanh toán"
        
        listProductCV.register(ProductOrderCell.self, forCellWithReuseIdentifier: cellId)
        featchData()
        setupView()
        self.loadViewIfNeeded()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeCollectionView()
    }
    
    func featchData() {
        guard let cart = cart else {return}
        orderDetails = cart.orderDetails ?? []
    }
    
    func setupView() {
        quantilyLabel.text = "Tạm tính(\(orderDetails.count) món)"
        priceShipLabel.text = "15000VND"
        
        var totalProduct = priceAllProduct()
        priceProductLabel.text = "\(totalProduct)VND"
        
        let total = totalProduct + shiperPrice
        priceTotalLabel.text = "\(total)VND"
        
        paymentButton.layer.cornerRadius = 8
    }
    
    private func priceAllProduct() -> Int{
        var total = 0
        orderDetails.forEach { order in
            guard let quantily = order.quantily, let priceOne = order.product?.price else {return}
            let price = priceProduct(quantily: quantily, price: priceOne)
            total += price
        }
        return total
    }
    
    private func priceProduct(quantily: String, price: String) -> Int {
        let quantilyInt = (quantily as NSString).integerValue
        let priceInt = (price as NSString).integerValue
        let priceProduct = quantilyInt * priceInt
        return priceProduct
    }

    @IBAction func addFoodClick(_ sender: Any) {
        print(#function)
    }
    
}

extension OrderDetailVC: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func changeCollectionView() {
        self.heightCollectionView.constant = self.listProductCV.contentSize.height
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: (view.frame.width - 40), height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        orderDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listProductCV.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductOrderCell
        if let quantily = orderDetails[indexPath.row].quantily, let product = orderDetails[indexPath.row].product {
            cell.nameLabel.text = product.title!
            cell.priceLabel.text = "\(product.price!)VND"
            cell.quantilyLabel.text = "\(quantily) x"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(orderDetails[indexPath.row])
    }
}
