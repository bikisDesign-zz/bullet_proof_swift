//
//  LoginVC.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 5/1/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

final class LoginViewController: AuthenticateUserViewController {
  
  lazy var signUpButton: UIButton = self.buttonFactory(with: .signup)
  
  lazy var forgotPassButton: UIButton = self.buttonFactory(with: .forgotpass)
  
  
  init(){
    super.init(type: .login)
  }
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  override func loadView() {
    super.loadView()
    signUpButton.bottomAnchor.constraint(equalTo: acceptButton.topAnchor, constant: -15).isActive = true
    signUpButton.leadingAnchor.constraint(equalTo: acceptButton.leadingAnchor).isActive = true
    signUpButton.trailingAnchor.constraint(equalTo: acceptButton.trailingAnchor).isActive = true
    signUpButton.heightAnchor.constraint(equalToConstant: ButtonViewModel.largeButtonHeight).isActive = true
    
    forgotPassButton.topAnchor.constraint(equalTo: form.bottomAnchor, constant: 15).isActive = true
    forgotPassButton.leadingAnchor.constraint(equalTo: acceptButton.leadingAnchor).isActive = true
    forgotPassButton.trailingAnchor.constraint(equalTo: acceptButton.trailingAnchor).isActive = true
    forgotPassButton.heightAnchor.constraint(equalToConstant: ButtonViewModel.largeButtonHeight).isActive = true
  }
}
