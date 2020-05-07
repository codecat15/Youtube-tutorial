//
//  LandmarkDetailView.swift
//  listDemo
//
//  Created by CodeCat15 on 5/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

struct LandmarkDetailView: View {
    var landmark: Landmark
    var body: some View {
        VStack
            {
                Image(landmark.photo)
                .resizable()
                .scaledToFit()

                Text(landmark.description)

                Spacer()
        }.padding()
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: Landmark(landmarkId: 1, name: "test", photo: "goi", description: "test description"))
    }
}
