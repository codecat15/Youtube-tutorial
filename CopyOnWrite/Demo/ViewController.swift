//
//  ViewController.swift
//  Demo
//
//  Created by Codecat15 on 7/20/22.
//

import UIKit

/**
 I hope the session was helpful, if you have any questions please feel free to ask and if you are new to the channel then please subscribe and support the channel by sharing it with your iOS group.
 
 Regards,
 Ravi (CodeCat15)
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let arr1: [Car] = [Car(withName: "Audi Q5"),Car(withName: "Audi R8"), Car(withName: "Audi e-tron")]
        
        var arr2 = arr1
        
        print("======= memory address BEFORE update ===========")
        MemoryAddress.printValueTypeAddress(value: arr1)
        MemoryAddress.printValueTypeAddress(value: arr2)
        
        arr2.append(Car(withName: "Audi RSQ8"))
        
        print("======= memory address AFTER update ===========")
        MemoryAddress.printValueTypeAddress(value: arr1)
        MemoryAddress.printValueTypeAddress(value: arr2)
    }
}

