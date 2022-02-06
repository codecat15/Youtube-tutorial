//
//  LoginChildCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/27/22.
//

import Foundation
import UIKit

class LoginChildCoordinator : ChildCoordinator {

    var model: Decodable? = nil
    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController

    init(with _navigationController: UINavigationController){
        self.navigationController = _navigationController
    }

    func configureChildViewController() {

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
       let homeChildCoordinator = ChildCoordinatorFactory.create(with: parentCoordinator!.navigationController, type: .home)
        homeChildCoordinator.passParameter(value: HomeChildParameter(userName: userName))

        parentCoordinator?.childCoordinator.append(homeChildCoordinator)
        parentCoordinator?.removeChildCoordinator(child: self)
        homeChildCoordinator.configureChildViewController()

    }
}
