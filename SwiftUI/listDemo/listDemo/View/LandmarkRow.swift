//
//  LandmarkRow.swift
//  listDemo
//
//  Created by CodeCat15 on 5/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack
            {
                Image(landmark.photo)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                Text(landmark.name)
                Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: Landmark(landmarkId: 1, name: "test", photo: "goi", description: "test"))
    }
}
