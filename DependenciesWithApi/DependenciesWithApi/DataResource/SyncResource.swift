//
//  SyncResource.swift
//  DependenciesWithApi
//
//  Created by CodeCat15 on 3/26/21.
//

import Foundation

/* Hey there, I hope the video was helpful. Please feel free to ask questions on the topic or you may suggest some videos on the topic you are finding hard to understand.

If you are new to the channel then please do subscribe and share the channel with your iOS group.

 Regards,
 Ravi
 */

struct SyncResource
{
    func syncDataResources()
    {

        let group = DispatchGroup()

        // employee block operation
        let employeeBlockOperation = BlockOperation()
        employeeBlockOperation.addExecutionBlock {

            let employeeDataResource = EmployeeDataResource()
            employeeDataResource.getEmployee { (employeeData) in
                employeeData?.forEach({ (employee) in
                    debugPrint(employee.name)
                })
            }
        }

        // project block operation
        let projectBlockOperation = BlockOperation()
        projectBlockOperation.addExecutionBlock {
            group.enter()
            let projectResource = ProjectDataResource()
            projectResource.getProject { (projectData) in
                projectData?.forEach({ (project) in
                    debugPrint(project.name)
                })
                group.leave()
            }

            group.wait()
        }

        // adding dependency
        employeeBlockOperation.addDependency(projectBlockOperation)

        // creating the operation queue
        let operationQueue = OperationQueue()
        operationQueue.addOperation(employeeBlockOperation)
        operationQueue.addOperation(projectBlockOperation)
    }
}
