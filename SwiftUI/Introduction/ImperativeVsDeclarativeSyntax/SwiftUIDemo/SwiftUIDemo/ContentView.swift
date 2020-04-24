//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by CodeCat15 on 4/22/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

/**Hey there, thank you for downloading the code and stopping by to watch the video, there will be more detailed videos on the swift UI series so stay tune and subscribe to the channel and share it with your iOS group.

If you have any questions regarding this session OR if you want to make any topic request with regards to swiftUI then please feel free to reach out to me ~Codecat15 */

struct ContentView: View {

    @State private var name : String = String()

    var body: some View {
        //Text("Hello, World!").font(.largeTitle)
        VStack
            {
                TextField("username", text: $name)
                Button(action: {
                    debugPrint("Hello \(self.name)")
                }, label: {
                    Text("Login")
                }).disabled(name.count < 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
