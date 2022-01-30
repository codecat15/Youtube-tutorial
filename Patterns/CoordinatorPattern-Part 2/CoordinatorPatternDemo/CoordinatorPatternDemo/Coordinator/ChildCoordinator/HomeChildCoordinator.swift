//
//  HomeChildCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/27/22.
//

import Foundation
import UIKit

class HomeChildCoordinator : Coordinator {
    var childCoordinator: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    private var homeViewUserName: String

    init(with _navigationController: UINavigationController
         , userName: String){
        self.navigationController = _navigationController
        self.homeViewUserName = userName
    }


    func configureRootViewController() {

        let homeVC = HomeVC.instantiateFromStoryBoard()
        homeVC.usrName = homeViewUserName
        self.navigationController.pushViewController(homeVC, animated: true)
    }


}
