//
//  ThirdView.swift
//  EnvironmentObjectDemo
//
//  Created by CodeCat15 on 5/21/21.
//

import SwiftUI

struct ThirdView: View {

    @EnvironmentObject var user : User
    @EnvironmentObject var account: Account

    var body: some View {
        Text("Logged in user name = \(user.name) with account balance = \(account.accountBalance)")
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
        .environmentObject(User())
        .environmentObject(Account())
    }
}
