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
  
  
  lazy var acceptButton: UIButton = self.buttonFactory(with: self.acceptButtonDatasource)
  
  private var acceptButtonDatasource: ButtonViewModel
  
  func buttonFactory(with viewModel: ButtonViewModel) -> UIButton {
    let button = UIButton(frame: CGRect.zero)
    button.setTitle(viewModel.styling.title, for: .normal)
    button.setTitleColor(viewModel.styling.textColor, for: .normal)
    self.view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = viewModel.styling.backgroundColor
    
    switch viewModel {
    case .login:
      button.addTarget(self, action: #selector(onAcceptButtonTap), for: .touchUpInside)
    case .forgotpass:
      button.addTarget(self, action: #selector(onForgotPassTap), for: .touchUpInside)
    case .signup:
      button.addTarget(self, action: #selector(onSetupTap), for: .touchUpInside)
    }
    return button
  }
  
  
  init(type: AccountType){
    switch type {
    case .login:
      acceptButtonDatasource = ButtonViewModel.login
    case .forgotPassword:
      acceptButtonDatasource = ButtonViewModel.forgotpass
    case .setup:
      acceptButtonDatasource = ButtonViewModel.signup
    }
    super.init(nibName: nil, bundle: nil)
  }
  required init?(coder aDecoder: NSCoder) { fatalError() }
  
  
  override func loadView() {
    view = UIView()
    view.backgroundColor = UIColor.white
    let tgr = UITapGestureRecognizer(target: self, action: #selector(onBackgroundTap))
    view.addGestureRecognizer(tgr)
    
    let margins = view.layoutMarginsGuide
    form.topAnchor.constraint(equalTo: margins.topAnchor, constant: view.frame.height / 16).isActive = true
    form.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    form.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    form.heightAnchor.constraint(equalToConstant: CGFloat(form.numberOfRows(inSection: 0)) * FormTableViewCell.cellHeight).isActive = true
    
    acceptButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -15).isActive = true
    acceptButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 15).isActive = true
    acceptButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -15).isActive = true
    acceptButton.heightAnchor.constraint(equalToConstant: ButtonViewModel.largeButtonHeight).isActive = true
  }
  
  
  //MARK: Gesture Recognizers
  @objc
  private func onBackgroundTap(){
    view.endEditing(true)
  }
  @objc
  private func onAcceptButtonTap(){
    
  }
  @objc
  private func onForgotPassTap(){
    
  }
  @objc
  private func onSetupTap(){
    
  }
}



extension AuthenticateUserViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return FormTableViewCell.cellHeight
  }
}
