//
//  SSNRule.swift
//  Deedz
//
//  Created by Aaron bikis on 10/6/16.
//  Copyright © 2016 Aaron bikis. All rights reserved.
//

import Foundation
/**
 `SAFormSSNRule` is a subclass of RegexRule that requires an input consisiting of a valid social security number.
 */
public class SSNRule: RegexRule {
    
    static let regex = "^\\d{3}-\\d{2}-\\d{4}$"
    /**
     Initializes a `SSNRule` object.
     
     - parameter message: String that holds error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message : String = "Invalid SSN"){
        self.init(regex: SSNRule.regex, message : message)
    }
}
