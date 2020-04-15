//
//  ImageRequestModel.swift
//  UploadImageSample
//
//  Created by CodeCat15 on 4/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct ImageRequest : Encodable
{
    let attachment : String
    let fileName : String
}

// use this for uploading images with byte array, and if you want me to give a session on what is byte array or base64 I am just a comment or an email away
//struct ImageRequest : Encodable
//{
//    let attachment : Data
//    let fileName : String
//}
