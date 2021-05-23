//
//  ContentView.swift
//  ObservableObjectDemo
//
//  Created by CodeCat15 on 5/17/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var user : User = User()

    var body: some View {

        VStack {

            Text("User name is \(user.name)")
                .font(.title2)

            TextField("user", text: $user.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
