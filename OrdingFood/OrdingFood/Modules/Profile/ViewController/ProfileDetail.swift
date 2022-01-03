//
//  ProfileDetail.swift
//  OrdingFood
//
//  Created by Vu Dat on 31/12/2021.
//

import UIKit

class ProfileDetail: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Thông tin cá nhân"
        
    }

    @IBAction func getLocation(_ sender: Any) {
        print("\(#function)")
        let updateDialog = BaseDialogView(frame: view.bounds)
        updateDialog.dialogBody.text = "Bạn có chắc muốn đăng xuất"
//        updateDialog.okButton.addTarget(self, action: #selector(logoutClick(_:)), for: .touchUpInside)
        updateDialog.show(animated: true)
    }
    
}
