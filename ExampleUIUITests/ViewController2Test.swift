//
//  ViewController2Test.swift
//  ExampleUI
//
//  Created by Alexander Shoshiashvili on 19/04/2017.
//  Copyright © 2017 Alexander Shoshiashvili. All rights reserved.
//

import XCTest
import UIKit

class ViewController2Test: ExampleUIUITests {
  
  override func setUp() {
    super.setUp()
    app.launchEnvironment = ["screenToLaunch": ViewForTest.viewController2.rawValue]
    app.launch()
  }
  
  func testViewController2() {
    let textField = app.textFields.element
    tapElementAndWaitForKeyboardToAppear(element: textField)
    app.typeText("123123")
    app.typeText("ads")
    app.typeText("123")
  }
  
}
