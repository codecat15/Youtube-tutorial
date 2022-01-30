//
//  Cooridnator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/22/22.
//

import Foundation
import UIKit

protocol Coordinator : AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinator : [Coordinator] { get set }
    func configureRootViewController()
}
