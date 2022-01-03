//
//  BaseDialogView.swift
//  OrdingFood
//
//  Created by Vu Dat on 31/12/2021.
//

import Foundation
import UIKit

class BaseDialogView: UIView, CustomDialogNew {
    func dimiss(animated: Bool) {
        //
    }
    var backgroundView: UIView = UIView()
    var dialogView: UIView = UIView()
    
    var dialogHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkGray
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Đã có phiên bản mới"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .medium)
        view.addSubview(label)
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 46),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 13),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        return view
    }()
    
    var dialogBody: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Đã có phiên bản mới. Bạn có muốn cập nhật ngay bây giờ không?"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    var okButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 19
        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.red
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Đồng ý", for: .normal)
        return button
    }()
    
    var dimisButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 19
        button.layer.borderWidth = 2
//        button.layer.borderColor = CGColor.
        button.backgroundColor = UIColor.white
        button.titleLabel?.font = .systemFont(ofSize: 18    )
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Để sau", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBaseViews()
    }
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func setupBaseViews() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        dialogView.backgroundColor = .white
        dialogView.addSubview(dialogHeader)
        dialogView.addSubview(dialogBody)
        dialogView.addSubview(okButton)
        dialogView.addSubview(dimisButton)
        
        NSLayoutConstraint.activate([
            dialogHeader.topAnchor.constraint(equalTo: dialogView.topAnchor),
            dialogHeader.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor),
            dialogHeader.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor),
            
            dialogBody.topAnchor.constraint(equalTo: dialogHeader.bottomAnchor, constant: 15),
            dialogBody.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 15),
            dialogBody.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor, constant: -15),
            
            okButton.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor, constant: -15),
            okButton.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 15),
            okButton.trailingAnchor.constraint(equalTo: dialogView.centerXAnchor, constant: -8),
            okButton.heightAnchor.constraint(equalToConstant: 38),
            dimisButton.bottomAnchor.constraint(equalTo: dialogView.bottomAnchor, constant: -15),
            dimisButton.leadingAnchor.constraint(equalTo: dialogView.centerXAnchor, constant: 8),
            dimisButton.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor, constant: -15),
            dimisButton.heightAnchor.constraint(equalToConstant: 38),
        ])
        dialogView.translatesAutoresizingMaskIntoConstraints = false
        dialogView.layer.cornerRadius = 5
        dialogView.clipsToBounds = true
        addSubview(dialogView)
        
        NSLayoutConstraint.activate([
            dialogView.centerYAnchor.constraint(equalTo: centerYAnchor),
            dialogView.centerXAnchor.constraint(equalTo: centerXAnchor),
            dialogView.widthAnchor.constraint(equalToConstant: 400),
            dialogView.heightAnchor.constraint(equalToConstant: 250),
        ])
        
        okButton.addTarget(self, action: #selector(dimissSelf), for: .touchUpInside)
        dimisButton.addTarget(self, action: #selector(dimissSelf), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func dimissSelf() {
        dismiss(animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.frame.origin.y == 0 {
                self.frame.origin.y -= keyboardSize.height/3
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.frame.origin.y != 0 {
            self.frame.origin.y = 0
        }
    }
    
    @objc func rotated() {
        switch UIDevice.current.orientation {
        default:
            let frame = UIScreen.main.bounds
            self.frame = frame
        }
    }
}
