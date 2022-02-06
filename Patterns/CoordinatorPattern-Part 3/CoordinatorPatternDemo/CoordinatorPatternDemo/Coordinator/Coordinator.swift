//
//  Cooridnator.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/22/22.
//

import Foundation
import UIKit

/**
 Hey there, I hope the video was helpful, please feel free to ask question on the topic as youtube comments or via email. I will be happy to answer them.

 If you like the content, then please do subscribe the channel and share the same with your iOS group.

 Here are some of the video links mentioned in the video,

 1. Coordinator part 1: https://youtu.be/Ji0bqURWv68

 2. Coordinator part 2: https://youtu.be/Pcx6k7_fgbo

 3. Factory pattern: https://youtu.be/faeoSJhN-Ko

 4. Interface segregation principle ISP: https://youtu.be/ZTmSP-ODoZo

 5. SOLID principle playlist: https://youtube.com/playlist?list=PLb5R4QC2DtFuC7WzUd5bJP3tdVsUcI8E8

 Regards,
 Ravi (CodeCat15) Happy iCoding

 */

protocol Coordinator : AnyObject {
    var navigationController: UINavigationController { get set }
}

protocol ParentCoordinator : Coordinator {
    var childCoordinator: [ChildCoordinator] { get set }
    func configureRootViewController()
    func removeChildCoordinator(child: ChildCoordinator)
}

protocol ChildCoordinator : Coordinator {
    var parentCoordinator : ParentCoordinator? { get set }
    func configureChildViewController()
    func passParameter(value: Decodable)
}

extension ChildCoordinator {
    func passParameter(value:Decodable) {}
}
