//
//  CoordinatorBoard.swift
//  CoordinatorPatternDemo
//
//  Created by CodeCat15 on 1/22/22.
//

import Foundation
import UIKit

protocol CoordinatorBoard : UIViewController {

    static func instansiateFromStoryBoard() -> Self

}

extension CoordinatorBoard {

    static func instansiateFromStoryBoard() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let id = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
