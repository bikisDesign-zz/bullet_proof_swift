//
//  AccountCoord.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 5/1/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

final class AccountCoordinator: NavigationCoordinator, NeedsDependency {
  var dependencies: AppDependency? {
    didSet {
      updateChildCoordinatorDependencies()
      processQueuedMessages()
    }
  }
  
  
  func configure(for type: AccountType){
    let vc = createViewController(for: type)
    vc.delegate = self
    show(vc)
  }
  
  private func createViewController(for type: AccountType) -> AuthenticateUserViewController {
    guard type != .login else {
      return LoginViewController()
    }
    return AuthenticateUserViewController(type: type)
  }
}
extension AccountCoordinator: AuthenticateUserViewControllerDelegate {
  func updateResponder(to type: AccountType) {
    configure(for: type)
  }
  
  func userProvidedValidated(credentials: Credentials, type: AccountType) {
    dependencies?.networking.perform(call: type, with: credentials, callback: { (response) in
      switch response {
      case ("success", 200):
        // update ui
        break
      default:
        // something happened!
        break
      }
    })
  }
}
