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
    return tv
  }()
  
  
  lazy var acceptButton: UIButton = {
    let button = UIButton(frame: CGRect.zero)
    
  }()
}
