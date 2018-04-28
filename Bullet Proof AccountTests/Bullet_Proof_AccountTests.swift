//
//  Bullet_Proof_AccountTests.swift
//  Bullet Proof AccountTests
//
//  Created by Aaron bikis on 4/28/18.
//  Copyright © 2018 Aaron bikis. All rights reserved.
//

import XCTest
@testable import Bullet_Proof_Account

class Bullet_Proof_AccountTests: XCTestCase {
  var applicationCoord: ApplicationCoordinator?
  var sut: AccountCoordinator?
  
  override func setUp() {
    super.setUp()
    applicationCoord = ApplicationCoordinator(rootViewController: UINavigationController())
  }
  
  override func tearDown() {
    applicationCoord = nil
    sut = nil
    super.tearDown()
  }
}
