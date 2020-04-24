//
//  ViewController.swift
//  ImperativeUIExample
//
//  Created by CodeCat15 on 4/22/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

/**Hey there, thank you for downloading the code and stopping by to watch the video, there will be more detailed videos on the swift UI series so stay tune and subscribe to the channel and share it with your iOS group.

If you have any questions regarding this session OR if you want to make any topic request with regards to swiftUI then please feel free to reach out to me ~Codecat15 */

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: Any) {
        debugPrint("btnLogin tapped")
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if((textField.text?.count)! >= 4)
        {
            self.btnLogin.isEnabled = true
        }
        else{
            self.btnLogin.isEnabled = false
        }
    }
}

