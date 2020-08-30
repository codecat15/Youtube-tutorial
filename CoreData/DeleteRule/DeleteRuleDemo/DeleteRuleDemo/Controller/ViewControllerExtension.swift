//
//  ViewControllerExtension.swift
//  DeleteRuleDemo
//
//  Created by CodeCat15 on 8/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.employees?.count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        87
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeListTC
        let employee = self.employees![indexPath.row]

        cell.lblEmployeeName.text = "\(employee.passportNumber!) => \(employee.name!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

            let currentEmployee = employees?[indexPath.row]
            guard currentEmployee != nil else {
                return
            }
            let result = passportDataManager.deletePassport(byId: currentEmployee!.id)
            if(result == true)
            {
                self.employees?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }

        }
    }
}
