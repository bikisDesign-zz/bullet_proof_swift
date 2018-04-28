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
    self.view.addSubview(tv)
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.delegate = self
    tv.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.reuseID)
    return tv
  }()
  
  
  lazy var acceptButton: AcceptButton = {
    let button = AcceptButton(frame: CGRect.zero)
    self.view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(onAcceptButtonTap), for: .touchUpInside)
    button.isEnabled = false
    return button
  }()

  
  override func loadView() {
    
    view = UIView()
    view.backgroundColor = UIColor.white
    
    let margins = view.layoutMarginsGuide
    form.topAnchor.constraint(equalTo: margins.topAnchor, constant: view.frame.height / 16).isActive = true
    form.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    form.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    form.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    
    acceptButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -15).isActive = true
    acceptButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
    acceptButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
    acceptButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    acceptButton.backgroundColor = UIColor.black
  }
  
  @objc private func onAcceptButtonTap(){
    
  }
}


extension AuthenticateUserViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
  }
}
