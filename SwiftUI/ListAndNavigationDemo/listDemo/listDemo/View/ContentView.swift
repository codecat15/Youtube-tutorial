//
//  ContentView.swift
//  listDemo
//
//  Created by CodeCat15 on 5/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    /*Hey there, I hope the video was helpful to you, please feel free to ask questions on this topic and do share this video with your iOS whatsap and facebook group ~Codecat15*/

    let cities = BundleDecoder.decodeLandmarkBundleJson()

    var body: some View {

        NavigationView
            {
                List
                    {
                        ForEach(cities, id: \.cityId){city in
                            Section(header: Text(city.name))
                            {
                                ForEach(city.landmarks, id: \.landmarkId)
                                {
                                    landmark in
                                    NavigationLink(destination: LandmarkDetailView(landmark: landmark))
                                    {

                                        LandmarkRow(landmark: landmark)
                                    }

                                }
                            }
                        }
                }.navigationBarTitle("Landmark")
        }


    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
