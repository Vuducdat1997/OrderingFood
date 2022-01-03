//
//  CartVC.swift
//  OrdingFood
//
//  Created by Vu Dat on 01/01/2022.
//

import UIKit

class CartVC: BaseViewController {
    let cartId = "CartViewCell"
    @IBOutlet weak var paymentButton: UIButton!

    @IBOutlet weak var tableView: UITableView!
    
    var checkOrder: Bool = false
    
    var cartData : [Cart]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = title
        tableView.register(UINib(nibName: "CartViewCell", bundle: nil), forCellReuseIdentifier: cartId)
        
        featchDataCart()
    }
   
    func featchDataCart() {
        print(UserDefaults.standard.retrieveArray(object: [Cart].self, fromKey: UserDefaults.Keys.CART_DATA_APP))
        let data = UserDefaults.standard.retrieveArray(object: [Cart].self, fromKey: UserDefaults.Keys.CART_DATA_APP)
        cartData = data
    }
    
    // MARK: - Init
    init(title: String?){
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
  
}

extension CartVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartData.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cartId, for: indexPath) as! CartViewCell
        cell.supplierNameLabel.text = cartData[indexPath.row].nameSupplier!
        cell.quantilyProductLabel.text = "\(getquantily(indexPath: indexPath)) Món"
        cell.priceLabel.text = "\(getPrice(indexPath: indexPath)) VND"
        return cell
    }
    
    func getPrice(indexPath: IndexPath) -> Int {
        var price = 0
        let orderDetails = cartData[indexPath.row].orderDetails
        orderDetails?.forEach({ orderDetail in
            let quantilyStr = orderDetail.quantily!
            let quantilyInt = (quantilyStr as NSString).integerValue
            let product = orderDetail.product
            let priceStr = product?.price!
            let priceInt = (priceStr! as NSString).integerValue
            let priceOne = priceInt * quantilyInt
            price += priceOne
        })
        
        return price
    }
    
    func getquantily(indexPath: IndexPath) -> Int{
        let orderDetails = cartData[indexPath.row].orderDetails
        var quantilyResult = 0
        orderDetails?.forEach({ orderDetail in
            let str = orderDetail.quantily!
            let int = (str as NSString).integerValue
            quantilyResult += int
        })
        return quantilyResult
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Create delete
        let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completionHandler) in
            print("Delete \(indexPath.row)")
            completionHandler(true)
        }
        
        //Create download
        let download = UIContextualAction(style: .normal, title: "Thanh toán") { (action, view, completionHandler) in
            print("Pay \(indexPath.row)")
            let vc = OrderDetailVC()
            vc.cart = self.cartData[indexPath.row]
            self.present(vc, animated: true, completion: nil)
            completionHandler(true)
        }
        download.backgroundColor = .systemTeal
        //swipe action
        let swipe = UISwipeActionsConfiguration(actions: [delete,download])
        return swipe
    }
}

