//
//  Solution.swift
//  SimpleFunctionDemo
//
//  Created by CodeCat15 on 11/24/22.
//

import Foundation

class Solution {
    
    // MARK: allSatisfy
    func collectionIsDivisibleBy2(arr: Array<Int>) -> Bool {
        
        guard !arr.isEmpty else { return false }
        
        return arr.allSatisfy({$0 % 2 == 0})
    }
    
    // MARK: max
    func findTheLargestNumber(from arr: Array<Int>) -> Int {
        
        guard !arr.isEmpty else { return 0 }
        return arr.max() ?? 0
    }
    
    // MARK: min
    func findTheSmallestNumber(from arr: Array<Int>) -> Int {
        guard !arr.isEmpty else { return 0 }
        return arr.min() ?? 0
    }
    
    /**
     Input: [1,2,3,4,5]
     Output: 15
     */
    // MARK: Reduce
    func getArraySum(arr: Array<Int>) -> Int {
        guard !arr.isEmpty else { return 0 }
        return arr.reduce(0, {$0 + $1})
    }
    
    
    func doesContain(elementWithName name: String, inCollection names: Array<String>) -> Bool {
        
        guard !names.isEmpty else {
            return false
        }
        
        return names.contains(where: {$0.caseInsensitiveCompare(name) == .orderedSame})
    }
    
}
