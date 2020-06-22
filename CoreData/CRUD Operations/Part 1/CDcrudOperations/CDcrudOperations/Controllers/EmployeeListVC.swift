//
//  EmployeeListVC.swift
//  CDcrudOperations
//
//  Created by CodeCat15 on 6/19/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var tblEmployee: UITableView!

   private let manager = EmployeeManager()
    var employees : [Employee]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        // Do any additional setup after loading the view.
        self.title = "Employees List"
    }

    // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        if(segue.identifier == SegueIdentifier.navigateToEmployeeDetailView)
        {
            let detailsView = segue.destination as? DetailVC
            guard detailsView != nil else { return }
        }
     }
}
