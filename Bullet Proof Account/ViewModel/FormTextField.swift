//
//  FormTextFieldVM.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

protocol FormTextField {
  var placeholder: String { get }
  var textColor: UIColor { get }
  var validationRules: [Rule]? { get }
  var keyboardType: UIKeyboardType { get }
}

extension FormTextField {
  var keyboardType: UIKeyboardType { return .default }
  var textColor: UIColor { return UIColor.lightGray }
  var validationRules: [Rule]? { return [RequiredRule()] }
}
