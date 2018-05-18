//
//  w6d5_ui_performance_testingUITests.swift
//  w6d5-ui-performance-testingUITests
//
//  Created by Raman Singh on 2018-05-18.
//  Copyright © 2018 Roland. All rights reserved.
//

import XCTest

class w6d5_ui_performance_testingUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUI() {
//                addNewMeal(mealName: "Burger", calories: 1200)
//                addNewMeal(mealName: "Tacos", calories: 100)
//                deleteMeal(mealName: "Burger", calories: 1200)

        
        
              
        
        
        
        
    }//testUI
    
    func testLabelShowsCorrectText() {
        let app = XCUIApplication()
        goToDetailViewController(mealName: "Tacos", calories: 100)
        

        
//        XCTAssert(app.staticTexts["detailViewControllerLabel"].label == "Tacos - 100", "Expected to be displaying Tacos - 100")
        
        
    }
    
    
    
    
    func addNewMeal(mealName:String, calories:Int) {
        
        let app = XCUIApplication()
        app.navigationBars["Master"].buttons["Add"].tap()
        
        let addAMealAlert = app.alerts["Add a Meal"]
        let collectionViewsQuery = addAMealAlert.collectionViews
        collectionViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText(mealName)
        
        let textField = collectionViewsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.tap()
        textField.typeText("\(calories)")
        addAMealAlert.buttons["Ok"].tap()

        
    }//addNewMeal
    
    func deleteMeal(mealName:String, calories:Int) {
        let app = XCUIApplication()
        let staticText = app.tables.staticTexts["\(mealName) - \(calories)"]
        if staticText.exists {
            staticText.swipeLeft()
            app.tables.buttons["Delete"].tap()
        }
    }//deleteMeal
    
    func goToDetailViewController(mealName:String, calories:Int) {
        let app = XCUIApplication()
        
        app.tables.staticTexts["\(mealName) - \(calories)"].tap()
        
        
        let tacos100StaticText = app.staticTexts["\(mealName) - \(calories)"]
        
        
        
    }//goToDetailViewController
    
    func goToMain() {
        let app = XCUIApplication()
        app.navigationBars["Detail"].buttons["Master"].tap()
    }
    
    
}
