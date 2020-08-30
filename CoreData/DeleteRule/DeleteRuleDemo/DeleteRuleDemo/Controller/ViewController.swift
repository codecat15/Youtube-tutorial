//
//  ViewController.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblEmployee: UITableView!

    let employeeDataManager = EmployeeDataManager()
    let passportDataManager = PassportDataManager()
    var employees: [Passport]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let documentDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(documentDirectoryPath[0])

       // createEmployee()
        
        employees = passportDataManager.getAllPassport()
        if(employees != nil && employees?.count != 0)
        {
            self.tblEmployee.reloadData()
        }
    }

    private func createEmployee()
    {
        let raviPassport = Passport(_id: UUID(), _passportNumber: "F106B9C278", _placeOfIssue: "Mumbai")
        let employeeRavi = Employee(_id: UUID(), _name: "Ravi", _email: "ravi@test.com", _passport: raviPassport)

        employeeDataManager.create(record: employeeRavi)

        let brucePassport = Passport(_id: UUID(), _passportNumber: "5A19E99A7B", _placeOfIssue: "Indore")
        let employeeBruce = Employee(_id: UUID(), _name: "Bruce", _email: "bruce@test.com", _passport: brucePassport)

        employeeDataManager.create(record: employeeBruce)

        let clarkPassport = Passport(_id: UUID(), _passportNumber: "317FE36FD2", _placeOfIssue: "Delhi")
        let employeeClark = Employee(_id: UUID(), _name: "Clark", _email: "clark@test.com", _passport: clarkPassport)

         employeeDataManager.create(record: employeeClark)
    }
}

