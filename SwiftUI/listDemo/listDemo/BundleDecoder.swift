//
//  BundleDecoder.swift
//  listDemo
//
//  Created by CodeCat15 on 5/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation

struct BundleDecoder
{
    static func decodeLandmarkBundleJson() -> [City] {
        let landmarkJson = Bundle.main.path(forResource: "landmarks", ofType: "json")
        let landmark = try! Data(contentsOf: URL(fileURLWithPath: landmarkJson!), options: .alwaysMapped)
        return try! JSONDecoder().decode([City].self, from: landmark)
    }
}
