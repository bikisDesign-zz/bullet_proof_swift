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
    show(vc)
  }
  
  private func createViewController(for type: AccountType) -> AuthenticateUserViewController {
    return AuthenticateUserViewController(type: type)
  }
}
