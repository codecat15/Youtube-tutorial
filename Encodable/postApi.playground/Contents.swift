import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*Thank you for downloading the source code, I hope you liked the video and I am sure you have questions so don't hesitate to ask questions I am always here for help.

 Do share this channel with your iOS group and please subscribe for more swift videos on writing clean code and the latest trends. ~Codecat15

 Link to api series playlist: https://www.youtube.com/playlist?list=PLb5R4QC2DtFuXr4177KQ2lIXOkqwq97a4

 */

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

struct Endpoint
{
    static let registerUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
    static let getUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
}

struct UserRegistrationRequest : Encodable
{
    let Name, Email, Password : String
    /*
     //Note: When I made the demo this was the initial contract used, after that the API has undergone some updates and the request contract has changed, I have kept the old contract just for reference purpose.
     
     let FirstName, LastName, Email, Password : String

    enum CodingKeys: String, CodingKey {
        case FirstName = "First_Name"
        case LastName = "Last_Name"
        case Email, Password
    }*/
}

struct UserRegistrationResponse: Decodable {
    let errorMessage: String
    let data: UserData
}

// MARK: - DataClass
struct UserData: Decodable {
    let name, email, id, joining: String
}

struct User
{
    func registerUserWithEncodableProtocol()
    {
        //code to register user
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        let request = UserRegistrationRequest(Name: "ravi", Email: "codecat15@gmail.com", Password: "1234")
        
        do {
            let requestBody = try JSONEncoder().encode(request)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        } catch let error {
            debugPrint(error.localizedDescription)
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0) {
                do {
                    // uncomment this code to view the server response in console
//                    let str = String(decoding: data!, as: UTF8.self)
//                    debugPrint(str)
                    let response = try JSONDecoder().decode(UserRegistrationResponse.self, from: data!)
                    debugPrint(response.data.name)
                }
                catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }

    func registerUser()
    {
        //code to register user
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        let dataDictionary = ["name":"codecat15", "email":"codecat15@gmail.com","password":"1234"]

        do {
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        } catch let error {
            debugPrint(error.localizedDescription)
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0) {
                let response = String(data: data!, encoding: .utf8)
                debugPrint(response!)
            }
        }.resume()
    }

    func GetUserFromServer()
    {
        var urlRequest = URLRequest(url: URL(string: Endpoint.getUser)!)
        urlRequest.httpMethod = "get"

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0)
            {
                let response = String(data: data!, encoding: .utf8)
                debugPrint(response!)
            }
        }.resume()
    }
}

let objUser = User()
objUser.registerUserWithEncodableProtocol()
