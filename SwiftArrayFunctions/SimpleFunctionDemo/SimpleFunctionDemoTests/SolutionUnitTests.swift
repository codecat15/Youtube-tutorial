//
//  SolutionUnitTests.swift
//  SimpleFunctionDemoTests
//
//  Created by CodeCat15 on 11/24/22.
//

import XCTest
@testable import SimpleFunctionDemo

class SolutionUnitTests: XCTestCase {

    var solution: Solution!
    
    // MARK: SetUp
    override func setUp() {
        solution = Solution()
    }
    
    // MARK: Collection is divisible by 2
    func test_withEmptyCollection_returnsFalse() {
        
        // ACT
        let result = solution.collectionIsDivisibleBy2(arr: Array<Int>())
        
        // ASSERT
        XCTAssertFalse(result)
    }
    
    func test_withPositiveCollection_returnsFalse() {
        
        // ARRANGE
        let arr: Array<Int> = [4, 2, 1, 205]
        
        // ACT
        let result = solution.collectionIsDivisibleBy2(arr: arr)
        
        // ASSERT
        XCTAssertFalse(result)
    }
    
    func test_withMixCollection_returnsTrue() {
        
        // ARRANGE
        let arr: Array<Int> = [-2, 4, -10, 20]
        
        // ACT
        let result = solution.collectionIsDivisibleBy2(arr: arr)
        
        // ASSERT
        XCTAssertTrue(result)
    }
    
    func test_withPositiveCollection_returnsTrue() {
        
        // ARRANGE
        let arr: Array<Int> = [2, 4, 10, 20]
        
        // ACT
        let result = solution.collectionIsDivisibleBy2(arr: arr)
        
        // ASSERT
        XCTAssertTrue(result)
    }
    
    // MARK: LargestNumber
    
    func test_findLargestNumber_withMixNumbers_ReturnsValue() {
        
        // ARRANGE
        let arr: Array<Int> = [-2, 4, 10, -20]
        let expectedLargestNumber = 10
        
        // ACT
        let result = solution.findTheLargestNumber(from: arr)
        
        // ASSERT
        XCTAssertTrue(expectedLargestNumber == result)
    }
    
    func test_findLargestNumber_withEmptyCollection_ReturnsValue() {
        // ACT
        let result = solution.findTheLargestNumber(from: Array<Int>())
        
        // ASSERT
        XCTAssertTrue(0 == result)
    }
    
    // MARK: Smallest Number
    func test_findSmallestNumber_withMixNumbers_ReturnsValue() {
        
        // ARRANGE
        let arr: Array<Int> = [-2, 4, 10, -20]
        let expectedLargestNumber = -20
        
        // ACT
        let result = solution.findTheSmallestNumber(from: arr)
        
        // ASSERT
        XCTAssertTrue(expectedLargestNumber == result)
    }
    
    func test_findSmallestNumber_withEmptyCollection_ReturnsValue() {
        
        // ACT
        let result = solution.findTheSmallestNumber(from: Array<Int>())
        
        // ASSERT
        XCTAssertTrue(0 == result)
    }
    
    // MARK: Get Sum
    func test_getArraySum_WithValidNumber_ReturnsValue() {
        
        let arr = [1,2,3,4,5]
        let expectedResult = 15
        
        // ACT
        let result = solution.getArraySum(arr: arr)
        
        // ASSERT
        XCTAssertTrue(expectedResult == result)
    }
    
    func test_getArraySum_withEmptyCollection_ReturnsValue() {
        
        // ACT
        let result = solution.getArraySum(arr: Array<Int>())
        
        // ASSERT
        XCTAssertTrue(0 == result)
    }
    
    // MARK: doesContainElement
    func test_doesContainElement_WithValidNames_ReturnsTrue() {
        
        let names = ["Ravi","CodeCat15"]
        
        // ACT
        let result = solution.doesContain(elementWithName: "CodeCat15", inCollection: names)
        
        // ASSERT
        XCTAssertTrue(result)
    }
    
    func test_doesContainElement_WithEmptyCollection_ReturnsFalse() {
        
        // ACT
        let result = solution.doesContain(elementWithName: "test", inCollection: Array<String>())
        
        // ASSERT
        XCTAssertFalse(result)
    }
    
    func test_doesContainElement_WithEmptyName_ReturnsFalse() {
        
        // ASSERT
        let names = ["Ravi","CodeCat15"]
        
        // ACT
        let result = solution.doesContain(elementWithName: String(), inCollection: names)
        
        // ASSERT
        XCTAssertFalse(result)
    }
    
    func test_doesContainElement_caseInSensitiveCompare_ReturnsTrue() {
        
        // ASSERT
        let names = ["Ravi","CodeCat15"]
        
        // ACT
        let result = solution.doesContain(elementWithName: "rAvI", inCollection: names)
        
        // ASSERT
        XCTAssertTrue(result)
    }
    
    // MARK: TearDown
    override func tearDown() {
        solution = nil
    }
}
