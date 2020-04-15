//
//  Common.swift
//  UploadImageSample
//
//  Created by CodeCat15 on 4/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

// I am on a trial version of the container, and the last day of the trial is May 15th 2020, so these services might not be active after that but the concepts of the video are valid till we have the internet 😉 .

struct Endpoints
{
    static let uploadImage = "https://api-dev-scus-demo.azurewebsites.net/api/Image/UploadImage"
    static let uploadImageWithByteArray = "https://api-dev-scus-demo.azurewebsites.net/api/Image/UploadImageWithByteArray"
    static let uploadImageMultiPartForm = "https://api-dev-scus-demo.azurewebsites.net/api/Image/UploadImageMultiPartForm"
}

// Use this endpoint for your code challenge.
struct ChallengeEndpoint
{
    static let multiPart = "https://api-dev-scus-demo.azurewebsites.net/api/Employee/MultiPartCodeChallenge"
}
