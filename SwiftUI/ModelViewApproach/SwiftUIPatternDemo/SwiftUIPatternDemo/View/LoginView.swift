//
//  LoginView.swift
//  SwiftUIPatternDemo
//
//  Created by CodeCat15 on 8/14/22.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var loginModel: LoginModel = LoginModel()
    @State private var response: LoginResponse? = nil
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = String()
    
    var body: some View {
        
        VStack {
            TextField("User email", text: $loginModel.userEmail)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $loginModel.userPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button {
                Task {
                    do{
                        response = try await loginModel.authenticateUser()
                        if(response == nil) {
                            alertMessage = Constant.INVALID_CREDENTIALS_ALERT_MESSAGE
                        }else {
                            alertMessage = "Hello \(response!.data!.userName)"
                        }
                        showAlert.toggle()
                    } catch {
                        debugPrint("service failure")
                    }
                }
            } label: {
                Text("Login")
            }
        }.padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text(Constant.ALERT_TITLE), message: Text(alertMessage), dismissButton: .default(Text(Constant.OK_ALERT_TITLE)))
            }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
