//
//  ViewControllerExtension.swift
//  MyPlacesApp
//
//  Created by CodeCat15 on 10/31/20.
//

import UIKit

extension UIViewController{

    func displayAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Alert", message:alertMessage , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}
