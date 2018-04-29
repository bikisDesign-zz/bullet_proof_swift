//
//  FormTableViewCell.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

final class FormTableViewCell: UITableViewCell {
  
  static let reuseID: String = "FormTableViewCell"
  
  lazy var textField: UITextField = {
    let tf = UITextField(frame: CGRect.zero)
    addSubview(tf)
    return tf
  }()
  
  override func layoutSubviews() {
    textField.frame = bounds
  }
  
  func setView(for field: FormTextField){
    textField.placeholder = field.placeholder
    textField.textColor = field.textColor
  }
}
