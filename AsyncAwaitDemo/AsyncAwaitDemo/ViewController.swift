//
//  ViewController.swift
//  AsyncAwaitDemo
//
//  Created by CodeCat15 on 11/15/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        Task{
            do {

                let employeeViewModel = EmployeeViewModel()
                let result = try await employeeViewModel.getPayroll()
                dump(result)

            } catch let serviceError {
                throw serviceError
            }

        }
//        let employeeViewModel = EmployeeViewModel()
//        // fetching the payroll details
//        employeeViewModel.getPayroll { result in
//            dump(result)
//        }
    }
}

