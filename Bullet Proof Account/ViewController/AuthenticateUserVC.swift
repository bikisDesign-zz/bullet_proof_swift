//
//  AccountVC.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit
protocol AuthenticateUserViewControllerDelegate: class {
  func userProvidedValidated(credentials: Credentials, type: AccountType)
  func updateResponder(to type: AccountType)
}

class AuthenticateUserViewController: UIViewController {
  
  var datasource: FormViewModel
  
  var delegate: AuthenticateUserViewControllerDelegate?
  
  lazy var form: UITableView = {
    let tv = UITableView(frame: CGRect.zero)
    self.view.addSubview(tv)
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.delegate = self
    tv.dataSource = datasource
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
    datasource = FormViewModel(type: type)
    switch type {
    case .login:
      acceptButtonDatasource = ButtonViewModel.login
    case .forgotPassword:
      acceptButtonDatasource = ButtonViewModel.forgotpass
    case .setup:
      acceptButtonDatasource = ButtonViewModel.signup
    }
    super.init(nibName: nil, bundle: nil)
    datasource.delegate = self
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
    datasource.validateForm()
  }
  @objc
  private func onForgotPassTap(){
    guard datasource.type != .forgotPassword else {
      datasource.validateForm()
      return
    }
    delegate?.updateResponder(to: .forgotPassword)
  }
  @objc
  private func onSetupTap(){
    guard datasource.type != .setup else {
      datasource.validateForm()
      return
    }
    delegate?.updateResponder(to: .setup)
  }
}


extension AuthenticateUserViewController: FormViewModelDelegate {
  func formWasValidated(_ successfully: ValidationCallback) {
    guard let errorMessage = successfully.1 else {
      var credentials = Credentials()
      for (index, key) in datasource.fields.enumerated() {
        guard let cell = form.cellForRow(at: IndexPath(item: index, section: 0)) as? FormTableViewCell else { return }
        credentials[key.apiKey] = cell.textField.text
      }
      
      delegate?.userProvidedValidated(credentials: credentials), type: datasource.type)
      return
    }
    
    let message = errorMessage.reduce(into: "", { $0 = "\($0 + "\n" + $1)" })
    let alertVC = UIAlertController(title: "Form Invalid",
                                    message: message,
                                    preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "Rodger!",
                                    style: .destructive,
                                    handler: nil))
    present(alertVC, animated: true, completion: nil)
  }
}


extension AuthenticateUserViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return FormTableViewCell.cellHeight
  }
}
