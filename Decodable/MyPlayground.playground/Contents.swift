import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*Thank you for downloading the code, I hope you enjoyed the video. Please feel free to ask questions and if you are new to the channel then please subscribe ~Codecat15 */

struct EmployeeResponse : Decodable
{
    let employeeId, depid: Int
    let salary: Double
    let name, role, joining, workPhone: String

    enum CodingKeys: String, CodingKey {
        case depid = "dep_id"
        case joining = "joining_date"
        case employeeId = "id"
        case salary
        case name, role, workPhone
    }
}

struct Employee
{
    func getEmployeeData()
    {
        let employeeApiUrl = "http://demo0333988.mockable.io/Employees"

        URLSession.shared.dataTask(with: URL(string: employeeApiUrl)!) { (responseData, httpUrlResponse, error) in

            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                //parse the responseData here
                let decoder = JSONDecoder()
                do {
                    //for single entity
                    //let result = try decoder.decode([EmployeeResponse].self, from: responseData!)

                    //for json with collection
                    let result = try decoder.decode([EmployeeResponse].self, from: responseData!)

                    for employee in result
                    {
                        debugPrint(employee.name)
                    }
                }
                catch let error
                {
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }

        }.resume()
    }
}

let objEmployee = Employee()
objEmployee.getEmployeeData()
