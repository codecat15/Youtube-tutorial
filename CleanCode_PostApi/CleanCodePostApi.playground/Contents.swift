import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*Thank you for downloading the source code, please feel free to try the httputility with your post and get request and make changes accordingly or if you are blocked then please do send me an email about it and we will resolve the issue together.
 */

/* If you like the work I am doing then please support the channel by subscribing to the channel and sharing with your iOS group and friends and on social media ~Codecat15*/

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

    func postApiData<T:Decodable>(requestUrl: URL, requestBody: Data, resultType: T.Type, completionHandler:@escaping(_ result: T)-> Void)
    {
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

            if(data != nil && data?.count != 0)
            {
                do {

                    let response = try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError {
                    debugPrint(decodingError)
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
    let FirstName, LastName, Email, Password : String

    enum CodingKeys: String, CodingKey {
        case FirstName = "First_Name"
        case LastName = "Last_Name"
        case Email, Password
    }
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
    var httpUtility : HttpUtility

    init(_httpUtility: HttpUtility) {
        httpUtility = _httpUtility
    }

    func registerUserWithEncodableProtocol()
    {
        //code to register user
        let registrationUrl = URL(string: Endpoint.registerUser)

        let request = UserRegistrationRequest(FirstName: "codecat", LastName: "15", Email: "codecat15@gmail.com", Password: "1234")

        do {

            let encodedRequest = try JSONEncoder().encode(request)
            httpUtility.postApiData(requestUrl: registrationUrl!, requestBody: encodedRequest, resultType: UserRegistrationResponse.self) { (userRegistrationResponse) in

                if(userRegistrationResponse.errorMessage.isEmpty)
                {
                    debugPrint(userRegistrationResponse.data.name)
                }
            }

        } catch let error {

            debugPrint("error = \(error.localizedDescription)")
        }

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

            if(data != nil && data?.count != 0)
            {
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

let objUser = User(_httpUtility: HttpUtility())
objUser.registerUserWithEncodableProtocol()

