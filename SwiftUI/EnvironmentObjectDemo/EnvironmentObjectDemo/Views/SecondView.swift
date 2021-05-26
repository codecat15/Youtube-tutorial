//
//  SecondView.swift
//  EnvironmentObjectDemo
//
//  Created by CodeCat15 on 5/20/21.
//

import SwiftUI

struct SecondView: View {

    @EnvironmentObject var account : Account
    
    var body: some View {

        VStack {

            Stepper("Balance \(account.accountBalance)", value: $account.accountBalance)

            NavigationLink("Navigate", destination: ThirdView())
        }.padding()
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
            .environmentObject(Account())
    }
}
