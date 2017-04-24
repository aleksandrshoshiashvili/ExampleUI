//
//  ViewController1Test.swift
//  ExampleUI
//
//  Created by Alexander Shoshiashvili on 19/04/2017.
//  Copyright © 2017 Alexander Shoshiashvili. All rights reserved.
//

import UIKit
import XCTest

class ViewController1Test: ExampleUIUITests {
  
  override func setUp() {
    super.setUp()
    app.launchEnvironment = ["screenToLaunch": ViewForTest.viewController1.rawValue]
    app.launch()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testViewController1() {
    let button = app.buttons.element
    button.tap()
  }
  
  func testDoubleTap() {
    let button = app.buttons.element
    button.doubleTap()
  }
  
}
