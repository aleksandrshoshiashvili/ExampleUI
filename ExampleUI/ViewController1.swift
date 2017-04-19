//
//  ViewController1.swift
//  ExampleUI
//
//  Created by Alexander Shoshiashvili on 19/04/2017.
//  Copyright © 2017 Alexander Shoshiashvili. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Action
  
  @IBAction func handleButtonAction(_ sender: Any) {
    view.backgroundColor = UIColor.rand()
  }
  
}
