//
//  EmployeeVC.swift
//  FCDemo
//
//  Created by CodeCat15 on 8/15/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class EmployeeVC: UIViewController {

    @IBOutlet weak var tblEmployee: UITableView!
     lazy var employeeDataProvider: EmployeeProvider =
    {
        let dataProvider = EmployeeProvider(With: self)
        return dataProvider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        debugPrint(path.first!)
        self.title = "Employees"
        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "showDetailVC")
        {
            let detailsVC = segue.destination as? DetailsVC
            if let indexPath = self.tblEmployee.indexPathForSelectedRow {
                let selectedEmployee = employeeDataProvider.fetchedResultController.object(at: indexPath)

                detailsVC?.selectedEmployee = selectedEmployee.convertToEmployee()
            }

        }
    }


}
