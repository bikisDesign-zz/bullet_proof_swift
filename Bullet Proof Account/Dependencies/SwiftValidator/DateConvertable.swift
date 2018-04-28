//
//  DateConvertable.swift
//  Deedz
//
//  Created by Aaron bikis on 10/25/16.
//  Copyright © 2016 Aaron bikis. All rights reserved.
//

import Foundation

protocol DateConvertable {
    func convertToString(_ date: Date) -> String
    func convertToDate(_ string: String) -> Date?
}

extension DateConvertable {
    /**
     `convertToString` converts a date to a String with the format of MM/dd/yyyy
     - parameter date: *Date* to be converted
     - returns: *String*
    */
    func convertToString(_ date: Date) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        return dateFormater.string(from: date)
    }
    
    /**
     `convertToDate` converts a String to a Date with the format of MM/dd/yyyy
     - parameter string: *String* to be converted
     - returns: *Date*
     */
    func convertToDate(_ string: String) -> Date? {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        return dateFormater.date(from: string)
    }
}
