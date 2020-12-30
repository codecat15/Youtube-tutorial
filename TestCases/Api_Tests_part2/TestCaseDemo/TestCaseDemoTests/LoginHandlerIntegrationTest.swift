//
//  LoginHandlerIntegrationTest.swift
//  TestCaseDemoTests
//
//  Created by CodeCat15 on 12/29/20.
//

import XCTest
@testable import TestCaseDemo

/**
 Hey there, thank you for downloading the source code and I hope the video was helpful as well, if you have any questions regarding test case, please feel free to ask them via youtube comments or email or you can ping me on any social media handle as shown in the video.

 You can also ask question on facebook page Swift programming India the link for the same is given below, Please do share this video with your friends and do ask them to subscribe and share the channel.

 Note: Please re-run the test if they fail, it might be that they waited for more than 5 seconds to run, but if you see some issues in the code feel free to reach out to me and I will fix it :)

 Thank you - CodeCat15 (Ravi)

 Link to swift programming india: https://www.facebook.com/groups/627612884568381
 */

class LoginHandlerIntegrationTest: XCTestCase {

    func test_LoginHandler_WithValidRequest_Returns_LoginData(){

        // ARRANGE
        let request = LoginRequest(userEmail: "codecat15@gmail.com", userPassword: "1234")
        let handler = LoginHandler()
        let loginExpectations = expectation(description: "WithValidRequest_Returns_LoginData")

        // ACT
        handler.authenticateUser(request: request) { (loginData) in
            // ASSERT
            XCTAssertNotNil(loginData)
            XCTAssertNil(loginData?.errorMessage)
            XCTAssertEqual(request.userEmail, loginData?.response?.data?.email)
            XCTAssertEqual("codecat15", loginData?.response?.data?.userName)
            XCTAssertEqual(15, loginData?.response?.data?.userID)
            loginExpectations.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_LoginHandler_WithInValidRequest_Returns_Error(){

        // ARRANGE
        let request = LoginRequest(userEmail: "test@test.com", userPassword: "1234")
        let handler = LoginHandler()
        let loginExpectations = expectation(description: "WithInValidRequest_Returns_Error")

        // ACT
        handler.authenticateUser(request: request) { (loginData) in
            // ASSERT
            XCTAssertNotNil(loginData)
            XCTAssertNil(loginData?.errorMessage)
            XCTAssertNotNil(loginData?.response?.errorMessage)
            XCTAssertNil(loginData?.response?.data)
            XCTAssertEqual("Invalid userEmail and password, please try again", loginData?.response?.errorMessage)

            loginExpectations.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_LoginHandler_WithEmptyString_Returns_Error(){

        // ARRANGE
        let request = LoginRequest(userEmail: "", userPassword: "")
        let handler = LoginHandler()
        let loginExpectations = expectation(description: "WithEmptyString_Returns_Error")

        // ACT
        handler.authenticateUser(request: request) { (loginData) in
            // ASSERT
            XCTAssertNotNil(loginData)
            XCTAssertNotNil(loginData?.errorMessage)
            XCTAssertNil(loginData?.response)
            XCTAssertEqual("email or password cannot be empty", loginData?.errorMessage)

            loginExpectations.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func test_LoginHandler_WithInvalidEmailId_Returns_Error(){

        // ARRANGE
        let request = LoginRequest(userEmail: "helloWorld", userPassword: "1234")
        let handler = LoginHandler()
        let loginExpectations = expectation(description: "WithInvalidEmailId_Returns_Error")

        // ACT
        handler.authenticateUser(request: request) { (loginData) in
            // ASSERT
            XCTAssertNotNil(loginData)
            XCTAssertNotNil(loginData?.errorMessage)
            XCTAssertNil(loginData?.response)
            XCTAssertEqual("email id is invalid", loginData?.errorMessage)

            loginExpectations.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
