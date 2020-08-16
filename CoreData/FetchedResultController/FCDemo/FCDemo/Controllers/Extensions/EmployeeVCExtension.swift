//
//  ViewControllerExtension.swift
//  FCDemo
//
//  Created by CodeCat15 on 8/15/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension EmployeeVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employeeDataProvider.fetchedResultController.fetchedObjects?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeTC
        
        let employee = employeeDataProvider.fetchedResultController.object(at: indexPath)
        cell.lblEmployeeName.text = employee.name
        
        return cell
    }
}

extension EmployeeVC : NSFetchedResultsControllerDelegate
{
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tblEmployee.reloadData()
    }
}
