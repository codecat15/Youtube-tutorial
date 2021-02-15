//
//  EmployeeResource.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import Foundation

/**
 I hope the video was helpful, please feel free to ask questions and do subscribe to the channel if you are new and support the channel by sharing it with your iOS group on whatsapp or facebook

 Regards,
 Ravi :)
 */

struct EmployeeResource {

    func getEmployee(userId: Int, completion: @escaping(_ result: [Employee]?)-> Void)
    {
        let webEmployeeDepartmentRequest = DepartmentRequest(userId: userId, department: "web")
        let mobileDepartmentRequest = DepartmentRequest(userId: userId, department: "mobile")

        let departmentRequest = [webEmployeeDepartmentRequest, mobileDepartmentRequest]
        var employees : [Employee] = []
        
        let dispatchGroup = DispatchGroup()

        departmentRequest.forEach { (request) in
            dispatchGroup.enter()
            getEmployee(byDepartment: request) { (response) in
                employees.append(contentsOf: (response?.data?.map{$0})!)
                dispatchGroup.leave()
            }
        }

//        dispatchGroup.enter()
//        getEmployee(byDepartment: webEmployeeDepartmentRequest) { (response) in
//            employees.append(contentsOf: (response?.data?.map{$0})!)
//            dispatchGroup.leave()
//        }
//
//        dispatchGroup.enter()
//        getEmployee(byDepartment: mobileDepartmentRequest) { (response) in
//            employees.append(contentsOf: (response?.data?.map{$0})!)
//            dispatchGroup.leave()
//        }

        dispatchGroup.notify(queue: .main) {
            completion(employees)
        }
    }


    func getEmployee(byDepartment departmentRequest: DepartmentRequest, completion: @escaping(_ result: EmployeeResponse?) -> Void)
    {
        var request = URLRequest(url: URL(string: "\(ApiResource.department!)Department=\(departmentRequest.department)&UserId=\(departmentRequest.userId)")!)

        request.httpMethod = "get"

        HttpUtility.shared.request(urlRequest: request, resultType: EmployeeResponse.self) { (response) in
                completion(response)
        }
    }
}
