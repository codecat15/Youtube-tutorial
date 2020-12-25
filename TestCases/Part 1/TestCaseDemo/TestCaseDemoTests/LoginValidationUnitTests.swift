//
//  LoginValidationUnitTests.swift
//  TestCaseDemoTests
//
//  Created by CodeCat15 on 12/24/20.
//

import XCTest
@testable import TestCaseDemo

/**
Hey there, thank you for downloading the source code and I hope the video was helpful as well, if you have any questions regarding test case, please feel free to ask them via youtube comments or email or you can ping me on any social media handle as shown in the video.
You can also ask question on facebook page Swift programming India the link for the same is given below, Please do share this video with your friends and do ask them to subscribe and share the channel.

 Thank you - CodeCat15 (Ravi)

 Link to swift programming india: https://www.facebook.com/groups/627612884568381
 */


class LoginValidationUnitTests: XCTestCase {

    func test_LoginValidation_With_EmptyStrings_Returns_ValidationFailure(){

        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(userEmail: "", userPassword: "")

        // ACT
        let result = validation.validate(request: request)

        // ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "email or password cannot be empty")

    }

    func test_LoginValidation_With_EmptyEmail_Returns_ValidationFailure(){

        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(userEmail: "", userPassword: "test")

        // ACT
        let result = validation.validate(request: request)

        // ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "email or password cannot be empty")

    }

    func test_LoginValidation_With_EmptyPassword_Returns_ValidationFailure(){

        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(userEmail: "test", userPassword: "")

        // ACT
        let result = validation.validate(request: request)

        // ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "email or password cannot be empty")

    }

    func test_LoginValidation_With_InvalidEmailId_Returns_ValidationFailure(){

        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(userEmail: "test", userPassword: "test")

        // ACT
        let result = validation.validate(request: request)

        // ASSERT
        XCTAssertFalse(result.isValid)
        XCTAssertNotNil(result.message)
        XCTAssertEqual(result.message, "email id is invalid")
    }

    func test_LoginValidation_With_ValidRequest_Returns_Success(){

        // ARRANGE
        let validation = LoginValidation()
        let request = LoginRequest(userEmail: "codecat15@gmail.com", userPassword: "test")

        // ACT
        let result = validation.validate(request: request)

        // ASSERT
        XCTAssertTrue(result.isValid)
        XCTAssertNil(result.message)
    }
}
