//
//  WelcomeView.swift
//  listDemo
//
//  Created by CodeCat15 on 5/6/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack
            {
                CircleImage()
                Text("List and Navigation Demo").font(.largeTitle)
        }.padding()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
