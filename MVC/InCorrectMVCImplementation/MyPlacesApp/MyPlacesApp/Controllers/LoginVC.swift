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

/* Hey there, thanks for downloading the source code, I hope the video was helpful in clearing your doubts on MVC. Please do feel free to ask questions on this topic I will be happy to answer your queries.

     Please do support the channel, by subscribing and sharing with your iOS group on Facebook or whatsApp would appreciate the support. */

    @IBAction func doLogin(_ sender: Any) {

        if(txtUserEmail.text!.count > 0 && txtPassword.text!.count > 0){ // 1. Count check

            if(validateEmail(value: txtUserEmail.text!)){ // 2. Email validation

                //3. Creating the request object
                var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/User/Login")!)
                urlRequest.httpMethod = "post"
                urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
                let loginRequest = LoginRequest(userEmail: txtUserEmail.text!, userPassword: txtPassword.text!)
                urlRequest.httpBody = try! JSONEncoder().encode(loginRequest)

                //4. Making the API call
                URLSession.shared.dataTask(with: urlRequest) { (responseData, urlResponse, networkError) in
                    if(networkError == nil && responseData != nil){

                        let result = try! JSONDecoder().decode(LoginResponse.self, from: responseData!)
                        if(result.data != nil){

                            //5. Navigate to a new view 
                            DispatchQueue.main.async {
                                self.performSegue(withIdentifier: "showPlacesList", sender: nil)
                            }
                        }
                    }else{
                        //6. Display network error alert
                        self.displayAlert(alertMessage: "Network error, please try again")
                    }
                }.resume()

            }else{
                //7. Display invalid email alert
                displayAlert(alertMessage: "Invalid email entered, please try again")
            }
        }else{
            //8. Display empty text field alert
            displayAlert(alertMessage: "Please enter valid credentials to begin")
        }
    }

    func validateEmail(value: String) -> Bool{
        let regex = try! NSRegularExpression(pattern: "(^[0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,64}$)", options: .caseInsensitive)
        return regex.firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) != nil
    }
}

