//
//  ViewController.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    private var user : User? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        let resource = LoginResource()
        let loginRequest = LoginRequest(userEmail: txtEmail.text!, userPassword: txtPassword.text!)
        resource.authenticateUser(request: loginRequest) { (response) in
            if(response?.errorMessage == nil) {
                self.user = response?.data
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "navigateToEmployeeList", sender: nil)
                }
            }
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "navigateToEmployeeList" {
            if let destinationVC = segue.destination as? EmployeeListVC {
                destinationVC.employeeId = self.user?.userID ?? 0
            }
        }
    }
}

