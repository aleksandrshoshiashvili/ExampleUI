//
//  ExampleUIUITests.swift
//  ExampleUIUITests
//
//  Created by Alexander Shoshiashvili on 19/04/2017.
//  Copyright © 2017 Alexander Shoshiashvili. All rights reserved.
//

import XCTest
import UIKit

enum ViewForTest: String {
  case viewController = "ViewController"
  case viewController1 = "ViewController1"
  case viewController2 = "ViewController2"
}

/**
 
 Родительский класс для тестов. 
 
 Сейчас сделано так, что чтобы переключить тестируемый экран, нужно переключить таргет и нажать Cmnd+U.
 
 Так как вьюх для тестирования может быть очень много, то идея с таргетами не самая лучшая. Можно сделать разные тесты в одном классе, и вызывать конкретный тест. Но в этом случае setUp нужно каждый раз менять.
 
 В классах ViewControllerTest, ViewController1Test и ViewController2Test идет настройка показываемого экрана и там же реализация нужного теста/тестов для экрана.
 
 */

class ExampleUIUITests: XCTestCase {
  
  /// Чтобы работало launchEnvironment, надо чтобы app был один и тот же
  
  let app = XCUIApplication()
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
}

extension XCTestCase {
  
  /**
   
   Расширения для тестирования элементов, которые вызывают появление клавиатуры
   
   - Выделяет элемент нажатием
   - Ждет, пока поднимется клавиатура
   
  */
  
  func tapElementAndWaitForKeyboardToAppear(element: XCUIElement) {
    let keyboard = XCUIApplication().keyboards.element
    element.tap()
    waitForElementToAppear(element: keyboard)
  }
  
  /**
   
   Расширения для тестирования появления элементов на экране
   
   - Ожидается, что элемент появился
   — Если по таймауту элемент не появился, то выдается ошибка
   
   */
  func waitForElementToAppear(element: XCUIElement, timeout: TimeInterval = 5,  file: String = #file, line: UInt = #line) {
    let existsPredicate = NSPredicate(format: "exists == true")
    expectation(for: existsPredicate,
                evaluatedWith: element, handler: nil)
    waitForExpectations(timeout: timeout) { (error) -> Void in
      if (error != nil) {
        let message = "Failed to find \(element) after \(timeout) seconds."
        self.recordFailure(withDescription: message, inFile: file, atLine: line, expected: true)
      }
    }
  }
  
  
  /**
   
   Костыль, который не дает закрыть симулятор в течение duration секунд. По дефолту держит в течение суток. 
   Чтобы завершить тестирование нужно остановить приложение.
   
   */
  func wait(for duration: TimeInterval = 60 * 60 * 24) {
    let waitExpectation = expectation(description: "Waiting")
    let when = DispatchTime.now() + duration
    DispatchQueue.main.asyncAfter(deadline: when) {
      waitExpectation.fulfill()
    }
    waitForExpectations(timeout: duration)
  }
}
