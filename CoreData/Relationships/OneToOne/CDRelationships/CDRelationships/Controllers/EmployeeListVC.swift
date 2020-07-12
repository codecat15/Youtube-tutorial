//
//  EmployeeListVC.swift
//  CDRelationships
//
//  Created by CodeCat15 on 7/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class EmployeeListVC: UIViewController {

    @IBOutlet weak var tblEmployeeList: UITableView!

    var employees : [Employee]? = nil
    private var manager = EmployeeManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Employees List"
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.employees = manager.getAllEmployee()
        if(employees != nil && employees?.count != 0)
        {
            self.tblEmployeeList.reloadData()
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == SegueIdentifier.navigateToDetailView)
        {
            let employeeDetailView = segue.destination as? EmployeeDetailVC
            guard employeeDetailView != nil else { return }
            employeeDetailView?.selectedEmployee = self.employees![self.tblEmployeeList.indexPathForSelectedRow!.row]
        }
    }
}
