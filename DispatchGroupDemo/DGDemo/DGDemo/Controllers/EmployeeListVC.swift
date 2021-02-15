//
//  EmployeeListVC.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import UIKit

class EmployeeListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var employeeId : Int = 0
    @IBOutlet weak var tblEmployee: UITableView!
    private var employee : [Employee]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Employees"
        self.navigationItem.hidesBackButton = true

        let resource = EmployeeResource()
        //let departmentRequest = DepartmentRequest(userId: employeeId, department: "web")

        resource.getEmployee(userId: employeeId) { (response) in
            self.employee = response
            DispatchQueue.main.async {
                self.tblEmployee.reloadData()
            }
        }

//        resource.getEmployee(byDepartment: departmentRequest) { (response) in
//
//            if((response?.errorMessage?.isEmpty) != nil) {
//                self.employee = response?.data
//                if(self.employee != nil && self.employee!.count > 0){
//
//                    DispatchQueue.main.async {
//                        self.tblEmployee.reloadData()
//                    }
//                }
//            }
//        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        118
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employee?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell") as! EmployeeCell

        let employee = self.employee![indexPath.row]
        cell.lblEmployeeName.text = employee.name
        cell.lblEmployeeEmail.text = employee.email

        return cell
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
