//
//  ViewController.swift
//  DependenciesWithApi
//
//  Created by CodeCat15 on 3/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let syncResource = SyncResource()
        syncResource.syncDataResources()

    }
}

