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


final class Networking: NSObject {
  
  func perform(call toNetwork: AccountType, with credentials: Credentials?, callback: @escaping (Response) -> ()) {
    credentials != nil ? print("processing credentials: \(credentials!)") : print("fetching user's password")
    callback(("success", 200))
  }
}
