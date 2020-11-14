//
//  ViewController.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserEmail: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /*Hey there, thanks for downloading the code, if you have any questions then please do ask them via comments or email.
     Do support the channel by sharing the content with your iOS group on facebook or whatsapp*/

    @IBAction func doLogin(_ sender: Any) {

        let request = LoginRequest(userEmail: txtUserEmail.text!, userPassword: txtPassword.text!)
        let validation = LoginValidation()
        let validationResult = validation.validate(request: request)

        if(validationResult.success){
            //do api call
            let resource = LoginResource()
            resource.authenticateUser(request: request) { (response) in
                if(response != nil)
                {
                    // navigate to list view
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "showPlacesList", sender: nil)
                    }
                }
            }
        }else{
            self.displayAlert(alertMessage: validationResult.errorMessage!)
        }
    }
}

