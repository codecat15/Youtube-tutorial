//
//  HomeChildCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/27/22.
//

import Foundation
import UIKit

class HomeChildCoordinator : ChildCoordinator {

    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController
    private var homeViewUserName: String = String()

    init(with _navigationController: UINavigationController){
        self.navigationController = _navigationController
    }

    func configureChildViewController() {
        let homeVC = HomeVC.instantiateFromStoryBoard()
        homeVC.usrName = self.homeViewUserName
        self.navigationController.pushViewController(homeVC, animated: true)
    }

    func passParameter(value: Decodable) {
        guard let parameter = value as? HomeChildParameter else {return}
        self.homeViewUserName = parameter.userName
    }
}
