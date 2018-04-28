//
//  ApplicationCoord.swift
//  FitBot_Activity_Tracker
//
//  Created by Aaron bikis on 4/6/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import Foundation

//  Protocol you need to apply to all the Coordinators,
//  so the new `dependencies` value is propagated down

protocol NeedsDependency: class {
  var dependencies: AppDependency? { get set }
}

extension NeedsDependency where Self: Coordinating {
  func updateChildCoordinatorDependencies() {
    self.childCoordinators.forEach { (_, coordinator) in
      if let c = coordinator as? NeedsDependency {
        c.dependencies = dependencies
      }
    }
  }
}

