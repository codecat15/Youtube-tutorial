//
//  ContentView.swift
//  EnvironmentObjectDemo
//
//  Created by CodeCat15 on 5/20/21.
//

import SwiftUI

/* Hey there, thank you for downloading the source code, I hope the environment object video was helpful in understanding it's core concepts. If you have doubts then please feel free to ask them via email or just message me on my social media handles.

 If you are new to the channel then please do subscribe to the channel so that I can stay motivated to bring more of such detailed videos for you. Do support the channel by subscribing and sharing it with your iOS groups on social media platfroms as well.

 Regards,
 Ravi (Codecat15)

 */

struct ContentView: View {

    @ObservedObject private var user : User = User()
    @ObservedObject private var account : Account = Account()

    var body: some View {
        NavigationView {
            VStack {

                Text("Logged in username = \(user.name)")
                TextField("Username", text: $user.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                NavigationLink("navigate to second view", destination: SecondView())
            }.padding()
            .navigationBarTitle(Text("Environment Object"))
        }.environmentObject(user)
        .environmentObject(account)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
