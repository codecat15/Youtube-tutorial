import UIKit
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/**Thank you for downloading the source code, I hope you liked the video. If you have any questions on this topic feel free to ask never hesitate we all are learners in this small world.
 Do share this video with your iOS group and if you are new to the channel then please do subscribe. ~codecat15*/

//Api documentation link: https://api-dev-scus-demo.azurewebsites.net/swagger/index.html

struct Endpoint
{
    static let registerUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
    static let getUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/GetUser"
}

struct User
{

    //code challenge: As mentioned in the video try to refractor this function by looking at the clean code api tutorial
    //link: https://youtu.be/pnMip8Gpa0w
    func registerUser()
    {
        //code to register user
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"
        let dataDictionary = ["name":"codecat15", "email":"codecat15@gmail.com","password":"1234"]

        do {
            let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary, options: .prettyPrinted)

            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type") //this line is very important as explained in the video

        } catch let error {
            debugPrint(error.localizedDescription)
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, httpUrlResponse, error) in

            if(data != nil && data?.count != 0)
            {
                //use decodable here to parse the json response, if you are new to decodable then watch the video
                //decodable video: https://youtu.be/RiuvxmoU37E
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
                //use decodable here to parse the json response, if you are new to decodable then watch the video
                //decodable video: https://youtu.be/RiuvxmoU37E
                let response = String(data: data!, encoding: .utf8)
                debugPrint(response!)
            }
        }.resume()
    }
}

let objUser = User()
objUser.GetUserFromServer()
