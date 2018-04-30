//
//  AccountVC.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

final class AuthenticateUserViewController: UIViewController {
  
  var datasource: FormViewModel
  
  lazy var form: UITableView = {
    let tv = UITableView(frame: CGRect.zero)
    self.view.addSubview(tv)
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.delegate = self
    tv.dataSource = datasource
    tv.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell.reuseID)
    return tv
  }()
  
  
  lazy var acceptButton: AcceptButton = {
    let button = AcceptButton(frame: CGRect.zero)
    self.view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(onAcceptButtonTap), for: .touchUpInside)
    return button
  }()

  
  init(type: AccountType){
    datasource = FormViewModel(type: type)
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
    acceptButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    acceptButton.backgroundColor = UIColor.black
  }

  
  //MARK: Gesture Recognizers
  @objc
  private func onAcceptButtonTap(){
    datasource.validateForm()
  }
  
  @objc
  private func onBackgroundTap(){
    view.endEditing(true)
  }
}


extension AuthenticateUserViewController: FormViewModelDelegate {
  func formWasValidated(_ successfully: ValidationCallback) {
    guard let errorMessage = successfully.1 else {
      
      return
    }
    
    let message = errorMessage.reduce(into: "", { $0 = "\($0 + "\n" + $1)" })
    let alertVC = UIAlertController(title: "I", message: <#T##String?#>, preferredStyle: <#T##UIAlertControllerStyle#>)
  }
}


extension AuthenticateUserViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return FormTableViewCell.cellHeight
  }
}
