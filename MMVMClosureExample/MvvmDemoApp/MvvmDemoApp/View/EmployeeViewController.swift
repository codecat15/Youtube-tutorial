//
//  EmployeeViewController.swift
//  MvvmDemoApp
//
//  Created by Codecat15 on 3/14/2020.
//  Copyright © 2020 Codecat15. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    @IBOutlet weak var sgcDepartment: UISegmentedControl!

    let employeeViewModel : EmployeeViewModel = EmployeeViewModel()
    var employeeTableData : EmployeeResponse? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        getEmployeesByDepartment(segmentedControlIndex: 0)
    }

    private func getEmployeesByDepartment(segmentedControlIndex: Int)
    {
        employeeViewModel.getEmployeesByDepartment(departmentIndex: segmentedControlIndex) { (employeeApiResponse) in

            if(employeeApiResponse != nil)
            {
                self.employeeTableData = employeeApiResponse

                DispatchQueue.main.async {
                    self.employeeTableView.reloadData()
                }
            }

        }
    }

    // MARK: - Segment control value change event
    @IBAction func sgcDepartmentDidChangeValue(_ sender: Any)
    {
        let segmentedControl = sender as! UISegmentedControl
        getEmployeesByDepartment(segmentedControlIndex: segmentedControl.selectedSegmentIndex)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

    

}
