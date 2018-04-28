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
    return tf
  }()
  
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 5, y: bounds.origin.y,
                  width: bounds.width - 10, height: bounds.height)
  }
  
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 5, y: bounds.origin.y,
                  width: bounds.width - 10, height: bounds.height)
  }
  
  
  func setView(){
    // update the reusable view here
  }
}
