//
//  CircleImage.swift
//  listDemo
//
//  Created by CodeCat15 on 5/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Original")
        .resizable()
        .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 6))
        .shadow(radius: 2).frame(width: 250, height: 250, alignment: .center)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
