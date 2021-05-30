//
//  ContentView.swift
//  BindingDemo
//
//  Created by CodeCat15 on 5/28/21.
//

import SwiftUI

/* Hey there, I hope the session was helpful in understanding the concept of binding and if not then please don't hesitate to ask questions I will be happy to answer them.
 If you are new to the channel please do subscribe and share the channel with your iOS group.

 Regards,
 Ravi (CodeCat15)
 */

struct ContentView: View {

    @State private var isOn : Bool = false

    var body: some View {
        VStack {
            Text("Binding Demo").font(.title).foregroundColor(isOn ? .blue : .gray)

            Text("CodeCat15").font(.title3).foregroundColor(.gray)

            ToggleChildView(isOn: $isOn)

        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
