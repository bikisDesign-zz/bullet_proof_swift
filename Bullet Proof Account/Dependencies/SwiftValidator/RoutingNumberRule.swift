//
//  RoutingNumberRule.swift
//  Deedz
//
//  Created by Aaron bikis on 10/25/16.
//  Copyright © 2016 Aaron bikis. All rights reserved.
//

import Foundation

/**
 `RoutingNumberRule` is a subclass of `Rule`. It is used to verify that a field has a date that is after the set minimum date
 */
public class RoutingNumberRule: Rule {
  private var message: String
  private var invalidNumberMessage: String
  
  public init(lengthMessage : String = "Must be 9 characters long", invalidNumberMessage: String = "Invalid Routing Number") {
    self.message = lengthMessage
    self.invalidNumberMessage = invalidNumberMessage
  }
  
  /**
   Validates a field.
   - parameter value: String to checked for validation.
   - returns: A boolean value. True if validation is successful; False if validation fails.
   */
  public func validate(_ value: String) -> Bool {
    var n = 0
    guard value.count == 9 else { return false }
    for i in stride(from: 0, through: value.count - 1, by: 3) {
      n += Int(String(value[value.index(value.startIndex, offsetBy: i + 0)]))! * 3
      n += Int(String(value[value.index(value.startIndex, offsetBy: i + 1)]))! * 7
      n += Int(String(value[value.index(value.startIndex, offsetBy: i + 2)]))! * 1
    }
    if ( n != 0 && n % 10 == 0 ) {
      return true
    }
    message = invalidNumberMessage
    return false
  }
  
  /**
   Displays error message when field has failed validation.
   
   - returns: String of error message.
   */
  public func errorMessage() -> String {
    return message
  }
}
