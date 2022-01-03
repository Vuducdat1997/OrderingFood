//
//  RegisterViewController.swift
//  OrdingFood
//
//  Created by Vu Dat on 16/12/2021.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfimTextField: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var phoneNumberLabel: UITextField!
    
    var registerVM : RegisterViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func registerClick(_ sender: Any) {
        print(#function)
        let email = emailTextField.text ?? "dat123"
        let pass = passwordTextField.text ?? "123456"
        let address = addressLabel.text ?? "HA Noi"
        let phone = phoneNumberLabel.text ?? "01231241249"
        
        registerVM = RegisterViewModel(cre: RegisterCredential(username: email, password: pass, address: address, phoneNumber: phone))
        
        registerVM.register { [self] respon in
            self.registerVM.responseFail = { string in
                let alert = UIAlertController(title: "Thông báo", message: "Sai tài khoản hoặc mật khẩu", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Huỷ", style: .default, handler: nil))
                navigationController?.present(alert, animated: true)

            }
            
            self.registerVM.responIsLoading = { bool in
                //Show animation
                print(bool)
            }
            guard let respon = respon else { return }
            
            self.registerVM.responseSuccess = { string in
                //Save access Token
                guard let accessToken = respon.accessToken else {return}
                UserDefaults.standard.set(accessToken, forKey: UserDefaults.Keys.ACCESS_TOKEN)
                //Check IsLogin
                UserDefaults.standard.set(true, forKey: UserDefaults.Keys.IS_LOGIN_APP)
                //save account
                let account: Array<String> = [email, pass, address, phone]
                UserDefaults.standard.set(account, forKey: UserDefaults.Keys.ACCOUNT_LOGIN)
                openTabbarView()
            } 
        }
    }
    
    func openTabbarView() {
        let vc = TabBarController() as UIViewController
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginClick(_ sender: Any) {
        pushToNibViewController(LoginViewController.self)
    }
}
