//
//  Networking.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import Foundation

typealias Credentials = [String: Any]
typealias Response = (String?, Int)

protocol NetworkingDelegate: class {
  func networkAttempt(returned response: Response, for call: AccountType)
}


final class Networking: NSObject {
  
  weak var delegate: NetworkingDelegate?
  
  func perform(call toNetwork: AccountType, with credentials: Credentials?) {
    credentials != nil ? print("processing credentials: \(credentials)") : print("fetching user's password")
    delegate?.networkAttempt(returned: ("success", 200), for: toNetwork)
  }
}
