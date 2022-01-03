//
//  LoginViewController2.swift
//  OrdingFood
//
//  Created by Vu Dat on 16/12/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var authViewModel: AuthViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func loginClick(_ sender: Any) {
        print(#function)
        let email = emailTextField.text ?? "dat123"
        let pass = passwordTextField.text ?? "123456"
        
        authViewModel = AuthViewModel(cre: UserCredential(username: email, password: pass))
        
        authViewModel.login { [self] respon in
            self.authViewModel.responseFail = { string in
                //Hien that bai
                let alert = UIAlertController(title: "Thông báo", message: "Sai tài khoản hoặc mật khẩu", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Huỷ", style: .default, handler: nil))
                navigationController?.present(alert, animated: true)
                print(string)
            }
            
            self.authViewModel.responIsLoading = { bool in
                //Show animation
                print(bool)
            }
            
            guard let respon = respon else { return }
            
            self.authViewModel.responseSuccess = { string in
                //Save access Token
                guard let accessToken = respon.accessToken else {return}
                UserDefaults.standard.set(accessToken, forKey: UserDefaults.Keys.ACCESS_TOKEN)
                //Check IsLogin
                UserDefaults.standard.set(true, forKey: UserDefaults.Keys.IS_LOGIN_APP)
                //OpenTabbar
                openTabbarView()
            }
             
        }
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func skipClick(_ sender: Any){
        UserDefaults.standard.register(defaults: [UserDefaults.Keys.ACCOUNT_LOGIN : []])
        openTabbarView()
    }
    
    func openTabbarView() {
        let vc = TabBarController() as UIViewController
        vc.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func registerClick(_ sender: Any) {
        print(#function)
        pushToNibViewController(RegisterViewController.self)
    }
}
