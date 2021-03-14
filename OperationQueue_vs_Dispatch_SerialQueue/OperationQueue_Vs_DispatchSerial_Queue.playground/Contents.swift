import UIKit

/**
Hey there, I hope the video was helpful. Please feel free to ask questions regarding the topic I will be happy to answer them for you. Do share the topic with your iOS group on facebook or whatsapp and if you are new to the channel please do support the channel by subscribing to it.

 Thank you
 Ravi (Codecat15) :)

 */

struct Employee
{
    func syncOfflineEmployeeRecords() {

        debugPrint("Syncing offline records for employee started")
        Thread.sleep(forTimeInterval: 2)
        debugPrint("Syncing completed for employee")
    }
}

struct Department
{
    func syncOfflineDepartmentRecords() {

        debugPrint("Syncing offline records for department started")
        Thread.sleep(forTimeInterval: 2)
        debugPrint("Syncing completed for department")
    }
}

struct SyncManager
{
    func syncOfflineRecords() {

        /** IMPORTANT!!! DO NOT DISTURB THE ORDER OF DEPARTMENT AND EMPLOYEE **

         As per user story 1234 we need to send department record first and then employee record so please do not break the sequence here

         We are using serial queue where sequence matters and if any change is expected in the upcoming release then please make your changes after the employee async

         If any other entity needs to be synced before department then please write that code above the department serial queue

         */

//        let serialQueue = DispatchQueue.init(label: "codecat15Example")
//
//        serialQueue.async {
//            let department = Department()
//            department.syncOfflineDepartmentRecords()
//        }
//
//        serialQueue.async {
//            let employee = Employee()
//            employee.syncOfflineEmployeeRecords()
//        }
//
//        serialQueue.async {
//            debugPrint("syncing project record")
//        }

        let employeeSyncOperation = BlockOperation()
        employeeSyncOperation.addExecutionBlock {
            let employee = Employee()
            employee.syncOfflineEmployeeRecords()
        }

        let departmentSyncOperation = BlockOperation()
        departmentSyncOperation.addExecutionBlock {
            let department = Department()
            department.syncOfflineDepartmentRecords()
        }

        employeeSyncOperation.addDependency(departmentSyncOperation)

        let operationQueue = OperationQueue()
        operationQueue.addOperation(employeeSyncOperation)
        operationQueue.addOperation(departmentSyncOperation)
    }
}

let obj = SyncManager()
obj.syncOfflineRecords()

