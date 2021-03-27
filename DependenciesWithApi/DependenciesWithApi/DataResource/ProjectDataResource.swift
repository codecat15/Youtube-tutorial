//
//  ProjectDataResource.swift
//  DependenciesWithApi
//
//  Created by CodeCat15 on 3/26/21.
//

import Foundation

struct ProjectDataResource
{
    func getProject(handler:@escaping(_ result: [Project]?)-> Void)
    {
        debugPrint("inside the get project function")

        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Project/GetProjects")!)
        urlRequest.httpMethod = "get"

        debugPrint("going to call the http utility for Project request")

        HttpUtility.shared.getData(request: urlRequest, response: [Project].self) { (result) in
            if(result != nil) {
                debugPrint("got the project response from api")
                handler(result)
            }
        }
    }
}
