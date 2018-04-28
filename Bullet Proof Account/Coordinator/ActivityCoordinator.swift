//
//  ActivityCoordinator.swift
//  Bullet Proof Account
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import UIKit

/**
 The initial and parent coordinator of the entire application.
 ### Things that should go here:
 * Initializing dependencies
 * Initial state configuration
 * Network calls to retrieve neccesary information for the app state i.e.
 * determining network availability for unfinished tasks
*/
final class ApplicationCoordinator: NavigationCoordinator, NeedsDependency {
  var dependencies: AppDependency? {
    didSet {
      updateChildCoordinatorDependencies()
      processQueuedMessages()
    }
  }
  
  
  override func start(with completion: @escaping () -> Void) {
    dependencies = AppDependency(networking: Networking())
    super.start(with: completion)
    let accountCoord = AccountCoordinator(rootViewController: rootViewController)
    accountCoord.dependencies = dependencies
    startChild(coordinator: accountCoord)
  }
}
