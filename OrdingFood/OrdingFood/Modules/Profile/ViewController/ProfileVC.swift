//
//  ProfileVC.swift
//  OrdingFood
//
//  Created by Vu Dat on 24/12/2021.
//

import UIKit

final class ProfileVC: UIViewController {

    // MARK: - Views
    lazy private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Home Button", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.setTitleColor(UIColor.defaultTint, for: .normal)
        button.backgroundColor = UIColor.Navigation.background
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 14, bottom: 6, right: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy private var imageProfile: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "ic_profile")
        iv.backgroundColor = UIColor.TabBar.itemBackground
        return iv
    }()
    
    lazy private var imageLine: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .darkGray
        return iv
    }()
    
    lazy private var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var data : [String] = ["Thông tin cá nhân", "Đã thích", "Đơn hàng của tôi","Thiết lập tài khoản", "Đăng xuất"]
    
    lazy private var nameLabel      = UILabel(text: "Tên:", font: .boldSystemFont(ofSize: 30))
    lazy private var gioitinhLabel  = UILabel(text: "Giới tính:", font: .systemFont(ofSize: 20))
    lazy private var dienThoaiLabel = UILabel(text: "Điện thoại:", font: .systemFont(ofSize: 20))
    lazy private var diaChiLabel    = UILabel(text: "Địa chỉ:", font: .systemFont(ofSize: 20))
    
    lazy private var nameContentLabel      = UILabel(text: "Vũ Đức Đạt", font: .boldSystemFont(ofSize: 30))
    lazy private var gioitinhContentLabel  = UILabel(text: "Nam", font: .systemFont(ofSize: 20))
    lazy private var dienThoaiContentLabel = UILabel(text: "0377092086", font: .systemFont(ofSize: 20))
    lazy private var diaChiContentLabel    = UILabel(text: "81 ngõ 50 Mễ Trì Thượng,Nam Từ Liêm,Hà Nội", font: .systemFont(ofSize: 20))
    
    // MARK: - Init
    init(title: String?){
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        navigationItem.title = title
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        button.layer.cornerRadius = button.frame.height / 2
    }

    // MARK: - UI
    private func setupUI() {
        view.backgroundColor = UIColor.background
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupConstraint() {
        view.addSubview(imageProfile)
        view.addSubview(imageLine)
        diaChiContentLabel.numberOfLines = 0
        let stackView2 = VerticalStackView(arrangedSubviews: [
            nameContentLabel,dienThoaiContentLabel,diaChiContentLabel
            ], spacing: 8)
//        view.addSubview(stackView)
        view.addSubview(stackView2)
        imageLine.constrainHeight(constant: 1)
        imageProfile.constrainHeight(constant: 124)
        imageProfile.constrainWidth(constant: 124)
        imageProfile.layer.cornerRadius = 62
        
        imageProfile.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 20, left: 20, bottom: 0, right: 0))
//        stackView.anchor(top: view.topAnchor, leading: imageProfile.trailingAnchor, bottom: nil, trailing: nil,padding: .init(top: 20, left: 20, bottom: 0, right: 0))
        stackView2.anchor(top: view.topAnchor, leading: imageProfile.trailingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 20, left: 20, bottom: 0, right: 8))
        
        imageLine.anchor(top: imageProfile.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        
        tableView.anchor(top: imageLine.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    // MARK: - Actions
    @objc func buttonTapped() {
        tabBarController?.selectedIndex = 0
    }
}

extension ProfileVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("Open profile")
            UIViewController.top()?.pushToNibViewController(ProfileDetail.self)
            break
        case 1:
            print("Shop Da thich")
            break
        case 2:
            tabBarController?.selectedIndex = 2
            break
        case 3:
            print("Thiet lap tai khoan")
            break
        case 4:
            print("Dang xuat")
            let alert = UIAlertController(title: "Thông báo", message: "Bạn có chắc muốn đăng xuất!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Huỷ", style: .default, handler: nil))
            navigationController?.present(alert, animated: true)
            break
        default:
            print(indexPath.row)
            break
        }
    }
    @objc func logoutClick(_ sender: UIButton) {
        print(#function)
    }
}

