//
//  ViewController.swift
//  ComponentsDemo
//
//  Created by CodeCat15 on 5/28/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Fields
    @IBOutlet weak var txtManufacturer: UITextField!
    @IBOutlet weak var txtColor: UITextField!

    private let smartPhoneResource: SmartPhoneResourceAccessor = SmartPhoneResourceAccessor()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Get Records button tapped
    @IBAction func getRecordsTapped(_ sender: Any) {

        let smartPhoneRequest = SmartPhoneRequest(color: txtColor.text, manufacturer: txtManufacturer.text)

        smartPhoneResource.getSmartPhones(request: smartPhoneRequest) { (response) in
            if(response?.data != nil && response?.data?.count != 0)
            {
                //your code here
            }else
            {
                //display error on main thread
            }
        }
    }
}

