//
//  FormVM.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

typealias FormFields = [FormTextField]

class FormViewModel: NSObject, UITableViewDataSource {
  
  static let cellHeight: CGFloat = 65
  
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
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: FormTableViewCell!
    cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.reuseID, for: indexPath) as? FormTableViewCell  ?? FormTableViewCell()
    cell?.setView(for: fields[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
}

private struct UserNameField: FormTextField {
  var placeholder: String = "User Name"
}

private struct PasswordField: FormTextField {
  var placeholder: String = "Password"
  var validationRules: [Rule]? = [MinLengthRule(length: 9, message: "Passwords need to be a minimum of 9 characters long")]
}

private struct EmailField: FormTextField {
  var placeholder: String = "Email Address"
  var validationRules: [Rule]? = [EmailRule()]
}
