//
//  AccountCoord.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
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
    switch type {
    case .login:
      return LoginViewController()
    case .forgotPassword:
      return AuthenticateUserViewController(type: .forgotPassword)
    case .setup:
      return AuthenticateUserViewController(type: .setup)
    }
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
        print("You're all logged in!")
        break
      default:
        print("issue with server")
        break
      }
    })
  }
}
