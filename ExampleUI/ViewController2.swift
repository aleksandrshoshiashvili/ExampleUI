//
//  ViewController2.swift
//  ExampleUI
//
//  Created by Alexander Shoshiashvili on 19/04/2017.
//  Copyright © 2017 Alexander Shoshiashvili. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textField.delegate = self
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
}

// MARK: - UITextFieldDelegate

extension ViewController2: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if string.isNumber || string.isEmpty {
      return true
    } else {
      textField.shake()
    }
    return false
  }
}

extension String  {
  var isNumber : Bool {
    get{
      return !self.isEmpty && self.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
  }
}

extension UIView {
  func shake() {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    animation.duration = 0.6
    animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
    layer.add(animation, forKey: "shake")
  }
}
