//
//  LoginChildCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/27/22.
//

import Foundation
import UIKit

class LoginChildCoordinator : Coordinator {

    var childCoordinator: [Coordinator] = [Coordinator]()
    weak var mainCoordinator: MainCoordinator?
    var navigationController: UINavigationController

    init(with _navigationController: UINavigationController){
        self.navigationController = _navigationController
    }

    func configureRootViewController() {

        let loginVC = LoginVC.instantiateFromStoryBoard()
        loginVC.loginChildCoordinator = self
        self.navigationController.pushViewController(loginVC, animated: false)
    }

    func navigateToResetPasswordVC() {
        
        let resetPasswordVC = ResetPasswordVC.instantiateFromStoryBoard()
        self.navigationController.pushViewController(resetPasswordVC, animated: true)
    }

    func navigateToSignUpVC() {

        let signUpVC = SignUpVC.instantiateFromStoryBoard()
        self.navigationController.pushViewController(signUpVC, animated: true)
    }

    func navigateToHomeVC(userName: String) {
       let homeChildCoordinator = HomeChildCoordinator(with: self.navigationController, userName: userName)
        mainCoordinator?.childCoordinator.append(homeChildCoordinator)
        mainCoordinator?.removeChildCoordinator(child: self)
        homeChildCoordinator.configureRootViewController()
    }
}
