//
//  MainCoordinator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/22/22.
//

import Foundation
import UIKit

/**

 Thank you for downloading the code, I hope the session was helpful and if you have any questions please feel free to ask them.

 If you are new to the channel subscribe for more Swift programming videos and do share the same with your iOS group on WhatsApp, LinkedIn or Slack.

 Regards,
 Ravi (CodeCat15)

 */


class MainCoordinator : Coordinator {

    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = [Coordinator]()

    init(with _navigationController : UINavigationController){
        self.navigationController = _navigationController
    }

    func configureRootViewController() {

        let loginChildCoordinator = LoginChildCoordinator(with: self.navigationController)
        childCoordinator.append(loginChildCoordinator)
        loginChildCoordinator.mainCoordinator = self
        loginChildCoordinator.configureRootViewController()
        
    }

    func removeFromChildCoordinator(child: Coordinator) {
        for(index, coordinator) in childCoordinator.enumerated() {
            if(coordinator === child) {
                childCoordinator.remove(at: index)
                break
            }
        }
    }
}
