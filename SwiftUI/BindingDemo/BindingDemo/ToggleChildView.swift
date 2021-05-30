//
//  ToggleChildView.swift
//  BindingDemo
//
//  Created by CodeCat15 on 5/29/21.
//

import SwiftUI

struct ToggleChildView: View {
    @Binding var isOn : Bool
    
    var body: some View {
        VStack{
            Toggle(isOn: $isOn, label: {
                Text("Is watching")
            }).fixedSize()
        }
    }
}

struct ToggleChildView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleChildView(isOn: .constant(false))
    }
}
