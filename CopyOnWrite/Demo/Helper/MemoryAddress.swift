//
//  PrintmemoryAddress.swift
//  Demo
//
//  Created by Codecat15 on 7/20/22.
//

import Foundation

class MemoryAddress {

    static func printReferenceTypeAddress(reference: AnyObject) {
        print(Unmanaged.passUnretained(reference).toOpaque())
    }
    
    static func printValueTypeAddress(value: UnsafeRawPointer){
        let bitPattern = Int(bitPattern: value)
        print(NSString(format: "%p", bitPattern))
    }
}
