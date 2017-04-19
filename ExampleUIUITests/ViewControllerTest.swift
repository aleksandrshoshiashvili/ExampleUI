//
//  ViewControllerTest.swift
//  ExampleUI
//
//  Created by Alexander Shoshiashvili on 19/04/2017.
//  Copyright © 2017 Alexander Shoshiashvili. All rights reserved.
//

import UIKit
import XCTest

class ViewControllerTest: ExampleUIUITests {
  
  override func setUp() {
    super.setUp()
    
    /**
     
     Сохраняет настройку в виде словаря, она используется на старте приложения в AppDelegate. 
     
     Здесь передается идентификатор Storyboard ID, по которому мы откроем сам контроллер.
     
     */
    
    app.launchEnvironment = ["screenToLaunch": ViewForTest.viewController.rawValue]
    app.launch()
  }
  
  func testTap() {
    let button = app.buttons.element
    button.tap()
    wait()
  }
  
}
