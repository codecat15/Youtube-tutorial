import UIKit
import PlaygroundSupport

/*Thank you for downloading the source code, I hope you enjoyed the video.

 Please do subscribe to my channel if you find the work I am doing is providing value in helping you understand the core concept and if not then do tell me what I can improve to make my videos better suggestions are always welcome.

 Feel free to ask questions if you have any, and do share this video with your iOS group or on social media

 Your's truly
 Codecat15 a.k.a Ravi :)

 */

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - TopicResponse
struct TopicResponse: Codable {
    let status: String
    let topics: [Topic]
    let channel, description: String

    enum CodingKeys: String, CodingKey {
        case status, topics, channel
        case description = "description"
    }
}

// MARK: - Topic
struct Topic: Codable {
    let id: String
    let image: [Image]
    let title, topicDescription: String
    let youtubeLink: String

    enum CodingKeys: String, CodingKey {
        case id, image, title
        case topicDescription = "description"
        case youtubeLink = "Youtubelink"
    }
}

// MARK: - Imageq
struct Image: Codable {
    let img1, img2: String
}


// MARK: - UserRegistration Request object
struct UserRegistrationRequest : Encodable
{
    let FirstName, LastName, Email, Password : String

    enum CodingKeys: String, CodingKey {
        case FirstName = "First_Name"
        case LastName = "Last_Name"
        case Email, Password
    }
}

// MARK: - UserRegistration Response object
struct UserRegistrationResponse: Codable {
    let errorMessage: String
    let data: UserData
}

// MARK: - UserData
struct UserData: Codable {
    let name, email, id, joining: String
}

struct Endpoint
{
    static let topic = "http://demo0333988.mockable.io/Topics"
    static let registerUser = "https://api-dev-scus-demo.azurewebsites.net/api/User/RegisterUser"
}

struct User
{
    func registerUser()
    {
        var urlRequest = URLRequest(url: URL(string: Endpoint.registerUser)!)
        urlRequest.httpMethod = "post"

        let request = UserRegistrationRequest(FirstName: "codecat", LastName: "15", Email: "codecat15@gmail.com", Password: "1234")

        do {
            let requestBody = try JSONEncoder().encode(request)
            urlRequest.httpBody = requestBody
            urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")

        } catch let error {
            debugPrint(error.localizedDescription)
        }

        URLSession.shared.dataTask(with: urlRequest) { (responseData, httpUrlResponse, error) in

            if(responseData != nil && responseData?.count != 0)
            {
                do {

                    let result = try JSONDecoder().decode(UserRegistrationResponse.self, from: responseData!)
                    debugPrint("registered user = \(result.data.name) user id = \(result.data.id)")

                } catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }

    func getNewsFeed()
    {
        URLSession.shared.dataTask(with: URL(string: Endpoint.topic)!) { (responseData, httpUrlResponse, error) in
            if(error == nil)
            {
                do {

                    let result = try JSONDecoder().decode(TopicResponse.self, from: responseData!)
                    for topic in result.topics
                    {
                        debugPrint("Topic title = \(topic.title), youtube url = \(topic.youtubeLink)")
                    }

                } catch let decodingError {
                    debugPrint(decodingError)
                }
            }
        }.resume()
    }
}

let objUser = User()
objUser.registerUser()
