//
//  ViewController.swift
//  ActorDemo
//
//  Created by CodeCat15 on 10/25/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let phoneStocks = PhoneStocks()
        let queue = DispatchQueue(label: "myQueue", attributes: .concurrent)

        queue.async {
            Task.detached{
                await phoneStocks.purchase(phone: "iPhone 13")
            }

        }

        queue.async {
            Task.detached{
                await phoneStocks.getAvailablePhones()
            }
        }
    }
}

