//
//  LoginAppTests.swift
//  LoginAppTests
//
//  Created by Arvind  on 10/21/24.
//

import XCTest
@testable import LoginApp

final class LoginViewModelTests: XCTestCase {
    
    var contentViewModel: LoginViewModel!

    override func setUpWithError() throws {
        contentViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        contentViewModel = nil
    }
    
    // Unit test to check if isAuthenticated(true) and showAlert(false) flags are set appropriately
    // when valid credentials are passed to authenticate the user
    func testValidCredentialsLogin() throws {
        contentViewModel.username = "Arvind"
        contentViewModel.password = "111"
        
        contentViewModel.login()
        
        XCTAssertTrue(contentViewModel.isAuthenticated, "User must provide valid credentials to be authenticated.")
        XCTAssertFalse(contentViewModel.showAlert, "Alert must not be shown for valid credentials.")
    }
    
    // Unit test to check if isAuthenticated(false) and showAlert(true) flags are set appropriately
    // when invalid credentials are passed to authenticate the user
    func testInvalidCredentialsLogin() throws {
        contentViewModel.username = "InvalidUsername"
        contentViewModel.password = "InvalidPassword"
        
        contentViewModel.login()
        
        XCTAssertFalse(contentViewModel.isAuthenticated, "User should not be authenticated with invalid credentials.")
        XCTAssertTrue(contentViewModel.showAlert, "Alert must be shown for invalid credentials.")
    }
    
    // Unit test to check if isAuthenticated(false) and showAlert(true) flags are set appropriately
    // when both credentials are empty
    func testEmptyCredentialsLogin() throws {
        contentViewModel.username = ""
        contentViewModel.password = ""
        
        contentViewModel.login()
        
        XCTAssertFalse(contentViewModel.isAuthenticated, "User should not be authenticated with empty credentials.")
        XCTAssertTrue(contentViewModel.showAlert, "Alert must be shown for empty credentials.")
    }
    
    // Unit test to check if isAuthenticated(false) and showAlert(true) flags are set appropriately
    // when only username is passed, but password is empty
    func testUsernameWithoutPasswordLogin() throws {
        contentViewModel.username = "Arvind"
        contentViewModel.password = ""
        
        contentViewModel.login()
        
        XCTAssertFalse(contentViewModel.isAuthenticated, "User should not be authenticated with partially empty credentials.")
        XCTAssertTrue(contentViewModel.showAlert, "Alert must be shown for partially empty credentials.")
    }
    
    // Unit test to check if isAuthenticated(false) and showAlert(true) flags are set appropriately
    // when only password is passed, but username is empty
    func testPasswordWithoutUsernameLogin() throws {
        contentViewModel.username = ""
        contentViewModel.password = "111"
        
        contentViewModel.login()
        
        XCTAssertFalse(contentViewModel.isAuthenticated, "User should not be authenticated with partially empty credentials.")
        XCTAssertTrue(contentViewModel.showAlert, "Alert must be shown for partially empty credentials.")
    }
}
