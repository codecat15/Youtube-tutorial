//
//  ContentView.swift
//  SearchBarListDemo
//
//  Created by CodeCat15 on 5/10/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

/*
 Hey there, please do feel free to reach out if you have questions on this topic I will be happy to answer them, and please do share this video with your iOS group on what's app or facebook or anyone who wants to learn swift ~Ravi
 */

struct ContentView: View {

    @State private var teams = BundleDecoder.decodeIPLTeamsBundleJson()
    @State private var searchBarText: String = String()

    var body: some View {

        VStack
            {

                SearchBarView(searchBarText: $searchBarText)

                List
                    {
                        ForEach(teams.filter({searchBarText.isEmpty ? true : $0.name.contains(searchBarText)}),id: \.id){team in
                            TeamRow(team: team)
                        }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
