import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// I hope you liked the video and it has helped you in giving a basic approach on how you can clean your code and write reusable code.
// Feel free to ask questions on this topic, I will be happy to answer you queries.

// Do share this video with your iOS group and please subscribe to the channel ~Codecat15

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

struct ReportsResponse: Decodable {
    let reports: [Report]
}

// MARK: - Report
struct Report: Decodable {
    let id, labourHours, totalCost: String
}

struct HttpUtility
{
    func getApiData<T:Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in

            if(error == nil && responseData != nil && responseData?.count != 0)
            {
                //parse the responseData here
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    _=completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }

        }.resume()
    }
}

struct Employee
{

    private let httpUtility: HttpUtility

    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }

    func getEmployeeData()
    {
        let employeeApiUrl = "http://demo0333988.mockable.io/Employees"

        httpUtility.getApiData(requestUrl: URL(string: employeeApiUrl)!, resultType: [EmployeeResponse].self) { (employeeResult) in

            if(employeeResult.count != 0)
            {
                for employee in employeeResult
                {
                    debugPrint(employee.name)
                }
            }
        }
    }

    func getReportsData()
    {
        let reportsApi = "http://demo0333988.mockable.io/getReports"

        httpUtility.getApiData(requestUrl: URL(string: reportsApi)!, resultType: ReportsResponse.self) { (reportsResponse) in

            if(reportsResponse.reports.count != 0)
            {
                for report in reportsResponse.reports
                {
                    debugPrint(report.labourHours)
                }
            }
        }
    }
}

let objEmployee = Employee(_httpUtility: HttpUtility())
objEmployee.getEmployeeData()
objEmployee.getReportsData()
