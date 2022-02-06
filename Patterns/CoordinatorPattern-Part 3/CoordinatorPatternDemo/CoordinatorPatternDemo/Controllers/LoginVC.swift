//
//  LoginVC.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/11/22.
//

import UIKit

class LoginVC: UIViewController, CoordinatorBoard {

    private var loginViewModel : LoginViewModel? = nil

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!

    weak var loginChildCoordinator : LoginChildCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel = LoginViewModel()
        title = "Login"
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapResetPassword(_ sender: Any) {

        if(loginChildCoordinator == nil){
            debugPrint("Child coordinator is nil")
        }

        loginChildCoordinator?.navigateToResetPasswordVC()
    }

    @IBAction func didTapSignUp(_ sender: Any) {
        loginChildCoordinator?.navigateToSignUpVC()
    }

    @IBAction func didTapLogin(_ sender: Any) {

        let request = AuthenticateRequest(userName: self.txtUserName.text, password: self.txtPassword.text)
        loginViewModel?.authenticateUser(request: request, completion: { result in
            if(result != nil) {

                self.loginChildCoordinator?.navigateToHomeVC(userName: self.txtUserName.text!)

            }else {
                // show failure alert
                let alert = UIAlertController(title: "Alert", message: "Login failed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        })
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
