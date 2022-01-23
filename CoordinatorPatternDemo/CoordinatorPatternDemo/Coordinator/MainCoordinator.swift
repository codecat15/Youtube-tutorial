//
//  MainCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/22/22.
//

import Foundation
import UIKit

/**

 Hey there, hope you are doing well and thank you for downloading the code. Please feel free to ask questions on this topic I will be happy to answer them.

 If you are new to the channel and have not subscribed yet, please do subscribe for more swift and clean coding content.

 Regards,
 Ravi (CodeCat15) :)

 */

class MainCoordinator : Coordinator {

    var navigationController: UINavigationController

    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }

    func configureRootViewController() {

        let loginVC = LoginVC.instansiateFromStoryBoard()
        loginVC.mainCoordinator = self
        self.navigationController.pushViewController(loginVC, animated: false)
    }

    func navigateToResetPasswordVC() {

        let resetPasswordVC = ResetPasswordVC.instansiateFromStoryBoard()
        self.navigationController.pushViewController(resetPasswordVC, animated: true)
    }

    func navigateToSignUpVC() {

        let signUpVC = SignUpVC.instansiateFromStoryBoard()
        self.navigationController.pushViewController(signUpVC, animated: true)
    }

    func navigateToHomeVC() {

        let homeVC = HomeVC.instansiateFromStoryBoard()
        self.navigationController.pushViewController(homeVC, animated: true)
    }


}
