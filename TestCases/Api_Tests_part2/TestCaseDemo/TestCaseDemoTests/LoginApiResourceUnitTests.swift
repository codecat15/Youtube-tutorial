//
//  LoginApiResourceUnitTests.swift
//  TestCaseDemoTests
//
//  Created by CodeCat15 on 12/28/20.
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

class LoginApiResourceUnitTests: XCTestCase {

    func test_LoginApiResource_With_ValidRequest_Returns_LoginResponse(){

        // ARRANGE
        let request = LoginRequest(userEmail: "codecat15@gmail.com", userPassword: "1234")
        let resource = LoginApiResource()
        let expectation = self.expectation(description: "ValidRequest_Returns_LoginResponse")

        // ACT
        resource.authenticateUser(request: request) { (loginResponse) in

            // ASSERT
            XCTAssertNotNil(loginResponse)
            XCTAssertNil(loginResponse?.errorMessage)
            XCTAssertEqual(request.userEmail, loginResponse?.data?.email)
            XCTAssertEqual("codecat15", loginResponse?.data?.userName)
            XCTAssertEqual(15, loginResponse?.data?.userID)
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

    }

    func test_LoginApiResource_With_InValidRequest_Returns_Error(){

        // ARRANGE
        let request = LoginRequest(userEmail: "Hello@world.com", userPassword: "1234")
        let resource = LoginApiResource()
        let expectation = self.expectation(description: "InValidRequest_Returns_Error")

        // ACT
        resource.authenticateUser(request: request) { (loginResponse) in

            // ASSERT
            XCTAssertNotNil(loginResponse)
            XCTAssertNotNil(loginResponse?.errorMessage)
            XCTAssertNil(loginResponse?.data)
            XCTAssertEqual("Invalid userEmail and password, please try again", loginResponse?.errorMessage)

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

    }

    func test_LoginApiResource_With_EmptyString_Returns_Error(){

        // ARRANGE
        let request = LoginRequest(userEmail: "", userPassword: "")
        let resource = LoginApiResource()
        let expectation = self.expectation(description: "EmptyString_Returns_Error")

        // ACT
        resource.authenticateUser(request: request) { (loginResponse) in

            // ASSERT
            XCTAssertNotNil(loginResponse)
            XCTAssertNotNil(loginResponse?.errorMessage)
            XCTAssertNil(loginResponse?.data)
            XCTAssertEqual("Please make sure you pass a valid username and password", loginResponse?.errorMessage)

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

    }

    func test_LoginApiResource_With_InvalidEmailFormat_Returns_Error(){

        // ARRANGE
        let request = LoginRequest(userEmail: "codecat15", userPassword: "1234")
        let resource = LoginApiResource()
        let expectation = self.expectation(description: "InvalidEmailFormat_Returns_Error")

        // ACT
        resource.authenticateUser(request: request) { (loginResponse) in

            // ASSERT
            XCTAssertNotNil(loginResponse)
            XCTAssertNotNil(loginResponse?.errorMessage)
            XCTAssertNil(loginResponse?.data)
            XCTAssertEqual("Please enter a valid email id and try again", loginResponse?.errorMessage)

            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

    }

}
