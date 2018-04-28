//
//  MinDateRule.swift
//  Validator
//
//  Created by Aaron bikis on 10/25/16.
//  Copyright © 2016 Aaron bikis. All rights reserved.
//

import Foundation

/**
 `MinDateRule` is a subclass of `Rule`. It is used to verify that a field has a date that is after the set minimum date
 */
public class MinDateRule: Rule, DateConvertable {
  private var minDate: Date
  private var message: String
  
  /**
   Initializes a `MinDateRule` object to verify that field has valid date.
   - parameter message: String of error message.
   - parameter years: Int (negative value) the minimum number of years from todays date
   - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
   */
  public init(years: Int = 18, message: String = "Must be at least 18 years old"){
    self.message = message
    let date = Date()
    let calendar = Calendar(identifier: .gregorian)
    var components = DateComponents()
    components.year = -years
    let minimumDate = calendar.date(byAdding: components, to: date)
    self.minDate = minimumDate!
  }
  
  /**
   Validates a field.
   - parameter value: String to checked for validation.
   - returns: A boolean value. True if validation is successful; False if validation fails.
   */
  public func validate(_ value: String) -> Bool {
    guard value != "" else { return false }
    let date = convertToDate(value)
    let comparision = date?.compare(minDate)
    if comparision == ComparisonResult.orderedAscending {
      return true
    }
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
