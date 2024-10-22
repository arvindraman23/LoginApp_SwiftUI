//
//  LoginAppUITests.swift
//  LoginAppUITests
//
//  Created by Arvind  on 10/21/24.
//

import XCTest

final class LoginAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    // UI Unit test to check if user is navigated to SecondView(Home Page)
    // when valid credentials are passed to authenticate
    func testValidCredentialsUILogin() throws {
        let usernameTextField = app.textFields["usernameTextField"]
        let passwordSecureField = app.secureTextFields["passwordSecureField"]
        let loginButton = app.buttons["Login"]
        
        usernameTextField.tap()
        usernameTextField.typeText("Arvind")
        
        passwordSecureField.tap()
        passwordSecureField.typeText("111")
        
        loginButton.tap()
        
        let secondViewText = app.staticTexts["Welcome"]
        XCTAssertTrue(secondViewText.waitForExistence(timeout: 3.0), "User must be navigated to SecondView upon successful login.")
    }
    
    // UI Unit test to check if invalid alert view is displayed
    // when invalid credentials are passed to authenticate
    func testInvalidCredentialsUILogin() throws {
        let usernameTextField = app.textFields["usernameTextField"]
        let passwordSecureField = app.secureTextFields["passwordSecureField"]
        let loginButton = app.buttons["Login"]
        
        usernameTextField.tap()
        usernameTextField.typeText("InvalidUsername")
        
        passwordSecureField.tap()
        passwordSecureField.typeText("InvalidPassword")
        
        loginButton.tap()
        
        let invalidAlertView = app.alerts["Invalid"]
        XCTAssertTrue(invalidAlertView.waitForExistence(timeout: 3.0), "Alert must be displayed for invalid login.")
    }
    
    // UI Unit test to check if invalid alert view is dismissed
    // when Ok button is pressed
    func testAlertViewDismissal() throws {
        let usernameTextField = app.textFields["usernameTextField"]
        let passwordSecureField = app.secureTextFields["passwordSecureField"]
        let loginButton = app.buttons["Login"]
        
        usernameTextField.tap()
        usernameTextField.typeText("InvalidUsername")
        
        passwordSecureField.tap()
        passwordSecureField.typeText("InvalidPassword")
        
        loginButton.tap()
        
        let invalidAlertView = app.alerts["Invalid"]
        XCTAssertTrue(invalidAlertView.waitForExistence(timeout: 3.0), "Alert must be displayed for invalid login.")
        
        let invalidAlertViewOkButton = invalidAlertView.buttons["Ok"]
        invalidAlertViewOkButton.tap()
        XCTAssertFalse(invalidAlertView.exists, "Alert must be dismissed after tapping on Ok button.")
    }

    // UI Unit test to check if user is navigated back to ContentView(Login Page)
    // when Back button is pressed from the SecondView(Home Page)
    func testSecondViewBackNavigation() throws {
        let usernameTextField = app.textFields["usernameTextField"]
        let passwordSecureField = app.secureTextFields["passwordSecureField"]
        let loginButton = app.buttons["Login"]
        
        usernameTextField.tap()
        usernameTextField.typeText("Arvind")
        
        passwordSecureField.tap()
        passwordSecureField.typeText("111")
        
        loginButton.tap()
        
        let secondViewWelcomeText = app.staticTexts["Welcome"]
        XCTAssertTrue(secondViewWelcomeText.waitForExistence(timeout: 3.0), "User must be navigated to SecondView upon successful login.")
        
        let secondViewNavigationBar = app.navigationBars["Home Page"]
        let navigationBarBackButton = secondViewNavigationBar.buttons.firstMatch
        
        navigationBarBackButton.tap()
        
        let loginPageNavigationBar = app.navigationBars["Login Page"]
        XCTAssertTrue(loginPageNavigationBar.waitForExistence(timeout: 3.0), "User must be navigated to first ContentView on tap of Back button.")
    }
}
