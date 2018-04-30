//
//  FormVM.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

typealias FormFields = [FormTextField]
typealias ValidationCallback = (Bool, [String]?)


protocol FormViewModelDelegate: class {
  func formWasValidated(_ successfully: ValidationCallback)
}


final class FormViewModel: NSObject {
  
  weak var delegate: FormViewModelDelegate?
  
  private lazy var validator = Validator()
  
  private var fields: FormFields {
    get {
      switch self.type {
      case .login:
        return [UserNameField(), PasswordField()]
        
      case .setup:
        return [EmailField(), UserNameField(), PasswordField()]
        
      case .forgotPassword:
        return [EmailField()]
      }
    }
  }
  
  private var type: AccountType
  
  init(type: AccountType) {
    self.type = type
    super.init()
  }
  
  func validateForm(){
    validator.validate(self)
  }
}


extension FormViewModel:  UITableViewDataSource  {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: FormTableViewCell!
    cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.reuseID, for: indexPath) as? FormTableViewCell  ?? FormTableViewCell()
    let field = cell!.setView(for: fields[indexPath.row])
    validator.registerField(field, rules: fields[indexPath.row].validationRules)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fields.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}


extension FormViewModel: ValidationDelegate {
  func validationSuccessful() {
    delegate?.formWasValidated((true, nil))
  }
  
  func validationFailed(_ errors: [(Validatable, ValidationError)]) {
    delegate?.formWasValidated((false, errors.map({ $0.1.errorMessage })))
  }
}


private struct UserNameField: FormTextField {
  var placeholder: String = "User Name"
}

private struct PasswordField: FormTextField {
  var placeholder: String = "Password"
  var validationRules: [Rule] = [MinLengthRule(length: 9, message: "Passwords need to be a minimum of 9 characters long")]
}

private struct EmailField: FormTextField {
  var placeholder: String = "Email Address"
  var validationRules: [Rule] = [EmailRule()]
}
