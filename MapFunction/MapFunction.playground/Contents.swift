import UIKit

/* Hey there, I hope the video was helpful for you, if you have questions on map which you think I was unable to answer with the video then please feel free to ask me via email. And if you are new to the channel then please do subscribe and do share this with your iOS group on facebook and whatsapp
 */

/*Example 1: looking at the difference between for loop and map function while transforming an Int array to a String array*/

let numbers :[Int] = [1,2,3,4]

func convertToString() -> [String]
{
    var result : [String] = []

    for value in numbers
    {
        result.append(String(value))
    }

    return result
}

debugPrint(convertToString())

func convertToStringUsingMap() -> [String]
{
    return numbers.map {String($0)}
}

/*****************End of first example******************************/

/*Example 2: Printing multiplication table using Map function*/

let multiplicationNumbers = [1,2,3,4,5,6,7,8,9,10]

func multiplication(value: Int) -> [Int]
{
    return numbers.map {$0 * value}
}

debugPrint(multiplication(value: 2))

/*****************End of second example******************************/

/* Example 3: Understanding the return type of Map function in more details */
struct Employee
{
    var name: String
    var salary: Double
}

func getEmployeeMock() -> [Employee]
{
    return [Employee(name: "Ravi", salary: 1500), Employee(name: "Codecat15", salary: 2500)]
}

func updateEmployeeSalary()
{
    let employees = getEmployeeMock()
    let result = employees.map { employee in
        employee.salary + 1000
    }

    debugPrint(result)
    debugPrint("employees = \(employees)")

}

updateEmployeeSalary()

/*****************End of third example******************************/
