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
    static func decodeIPLTeamsBundleJson() -> [Teams] {
        let iplTeamJson = Bundle.main.path(forResource: "iplTeams", ofType: "json")
        let teamsData = try! Data(contentsOf: URL(fileURLWithPath: iplTeamJson!), options: .alwaysMapped)
        return try! JSONDecoder().decode([Teams].self, from: teamsData)
    }
}
