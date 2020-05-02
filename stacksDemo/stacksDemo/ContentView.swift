//
//  ContentView.swift
//  stacksDemo
//
//  Created by CodeCat15 on 4/29/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import SwiftUI

/*Hey there thank you for stopping by, I hope the video tutorial helped and if you have any questions feel free to reach out.

 Do share this video with your iOS group and do subscribe to the channel ~Codecat15*/

struct ContentView: View {

    @State private var userName: String = String()
    @State private var userPassword: String = String()

    var body: some View {
        VStack
            {
                Text("Login").font(.largeTitle).padding()

                Text("Explore SwiftUI with Codecat15").font(.subheadline).padding()

                TextField("userName", text: $userName)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(4.0)

                SecureField("password", text: $userPassword)
                .padding()
                .background(Color.gray)
                .cornerRadius(4.0)

                HStack
                    {
                        Button(action: {
                            debugPrint("Login tapped")
                        }, label: {
                            Text("Login")
                            })

                        Spacer()

                        Button(action: {
                            debugPrint("Forgot password tapped")
                        }, label: {
                            Text("Forgot password")
                            })
                }.padding()


        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
