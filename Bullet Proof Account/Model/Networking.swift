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
  func networkAttempt(returned response: Response, for call: Networking.Call)
}


final class Networking: NSObject {
  
  enum Call {
    case login, forgotPassword, signUp
  }
  
  weak var delegate: NetworkingDelegate?
  
  func perform(call toNetwork: Networking.Call, with credentials: Credentials) {
    print("processing credentials: \(credentials)")
    delegate?.networkAttempt(returned: ("success", 200), for: toNetwork)
  }
}
