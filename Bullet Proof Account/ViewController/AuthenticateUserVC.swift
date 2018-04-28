//
//  AccountVC.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

final class AuthenticateUserViewController: UIViewController {
  
  
  lazy var form: UITableView = {
    let tv = UITableView(frame: CGRect.zero)
    tv.delegate = self
    tv.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.reuseID)
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  
  
  lazy var acceptButton: AcceptButton = {
    let button = AcceptButton(frame: CGRect.zero)
    button.addTarget(self, action: #selector(onAcceptButtonTap), for: .touchUpInside)
    button.isEnabled = false
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func loadView() {
    
    view = UIView()
    view.backgroundColor = UIColor.white
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let margins = view.layoutMarginsGuide
    form.topAnchor.constraint(equalTo: margins.topAnchor, constant: view.frame.height / 16)
    form.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
    form.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
    form.heightAnchor.constraint(equalToConstant: 100)
    // need heightAnchor
    
    acceptButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -15)
    acceptButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15)
    acceptButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 15)
    acceptButton.heightAnchor.constraint(equalToConstant: 55)
    
    view.addSubview(form)
    view.addSubview(acceptButton)
  }
  
  
  @objc private func onAcceptButtonTap(){
    
  }
}


extension AuthenticateUserViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
  }
}
