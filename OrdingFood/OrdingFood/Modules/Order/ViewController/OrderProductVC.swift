//
//  ListProductVC.swift
//  OrdingFood
//
//  Created by Vu Dat on 22/12/2021.
//

import UIKit
import Nuke
class OrderProductVC: UIViewController {

    @IBOutlet weak var useButton: UIButton!
    @IBOutlet weak var quantilyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var data : Product!
    var nameSupplier : String!
    var quantily = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    

    func setupView() {
        useButton.layer.cornerRadius = 10
        
        nameLabel.text = data.title ?? ""
        priceLabel.text = "\( data.price ?? "")VND"
        
        let url : URL = URL(string: data.url!)!
        Nuke.loadImage(with: url, into: imageView)
    }
    
    func setButtonColor() {
        if quantily > 0{
            useButton.backgroundColor = .blue
        } else {
            useButton.backgroundColor = .lightGray
        }
    }
    
    @IBAction func reducationClick(_ sender: Any) {
        if quantily > 0 {
            quantily -= 1
            quantilyLabel.text = "\(quantily)"
        }
        setButtonColor()
    }
    
    @IBAction func plusClick(_ sender: Any) {
        quantily += 1
        quantilyLabel.text = "\(quantily)"
        setButtonColor()
    }
    
    
    @IBAction func useClick(_ sender: Any) {
//        dismiss(animated: true) {
//            self.saveProduct(quantily: self.quantily, product: self.data)
//        }
        saveProduct(quantily: quantily, product: data)
    }
    
    func saveProduct(quantily: Int, product: Product) {
        //save data
        let orderDetail : OrderDetail = OrderDetail(quantily: "\(quantily)", product: product)
        let supplierId = product.supplierId!
        //check data cart
        let dataCart = UserDefaults.standard.retrieveArray(object: [Cart].self, fromKey: UserDefaults.Keys.CART_DATA_APP)
        var dataCartChange = [Cart]()
        var checkNewCart = false
        if let result = dataCart {
            result.forEach { cart in
                if supplierId == cart.supplierId! {
                    var orderDetails = cart.orderDetails!
                    orderDetails.append(orderDetail)
                    let cartNew : Cart = Cart(supplierId: supplierId,nameSupplier: nameSupplier ,orderDetails: orderDetails)
                    dataCartChange.append(cartNew)
                    checkNewCart = true
                } else {
                    dataCartChange.append(cart)
                }
            }
            
            if !checkNewCart{
                var orderDetails : [OrderDetail] = []
                orderDetails.append(orderDetail)
                let cart : Cart = Cart(supplierId: supplierId,nameSupplier: nameSupplier, orderDetails: orderDetails)
                dataCartChange.append(cart)
            }
            
            UserDefaults.standard.saveArray(customObject: dataCartChange, inKey: UserDefaults.Keys.CART_DATA_APP)
        } else {
            var orderDetails : [OrderDetail] = []
            orderDetails.append(orderDetail)
            let cart : Cart = Cart(supplierId: supplierId,nameSupplier: nameSupplier , orderDetails: orderDetails)
            var carts = [Cart]()
            carts.append(cart)
            UserDefaults.standard.saveArray(customObject: carts, inKey: UserDefaults.Keys.CART_DATA_APP)
        }
        
        dismiss(animated: true) {
            let alert = UIAlertController(title: "Thông báo", message: "Đã thêm thành công. Vui lòng kiểm tra giỏ hàng và thanh toán!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Đi tới giỏ hàng", style: .cancel, handler: { a in
                UIViewController.top()?.tabBarController?.selectedIndex = 2
            }))
            alert.addAction(UIAlertAction(title: "Tiếp tục đặt hàng", style: .default, handler: nil))
            UIViewController.top()?.navigationController?.present(alert, animated: true)
        }
    }
}
