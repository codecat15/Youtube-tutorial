//
//  ContentView.swift
//  SimpleApiDemo
//
//  Created by CodeCat15 on 6/19/21.
//

import SwiftUI

/* Hey there, I hope the video was helpful and if you have questions then please feel free to ask them via comments or you can reach out via other social platform.
 
 In the coming days we will explore more "combine" ways to make our code better. If you are new to the channel then please do subscribe to the channel and share it among your iOS group or with anyone who wants to learn swift the right way

 Regrards,
 Ravi (CodeCat15)
 */

struct ContentView: View {

    @ObservedObject var loginViewModel = LoginViewModel()

    var body: some View {
        NavigationView{
            VStack{
                
                TextField("useremail", text: $loginViewModel.loginDataModel.userEmail)
                    .keyboardType(.emailAddress)

                SecureField("password", text: $loginViewModel.loginDataModel.userPassword)

                NavigationLink(
                    destination: HomeView(),
                    isActive: $loginViewModel.loginDataModel.navigate,
                    label: {
                        Button(action: {
                            if(loginViewModel.validateUserInputs()){
                                loginViewModel.authenticateUser()
                            }
                        }, label: {
                            Text("Login")
                        }).alert(isPresented: $loginViewModel.loginDataModel.isPresentingErrorAlert, content: {
                            Alert(title: Text("Alert"), message: Text(loginViewModel.loginDataModel.errorMessage), dismissButton: .cancel(Text("Ok")))
                        })
                    })
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .navigationTitle("Login")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
