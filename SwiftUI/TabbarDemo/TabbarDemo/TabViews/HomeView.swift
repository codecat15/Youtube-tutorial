//
//  HomeView.swift
//  TabbarDemo
//
//  Created by CodeCat15 on 1/19/21.
//

import SwiftUI

struct HomeView: View {

    @State private var planets : [String] = ["Mercury","Venus","Earth","Mars","Jupiter","Saturn","Urnaus","Neptune","Pluto"]

    var body: some View {

        NavigationView {
            List(planets, id:\.self){ planet in
                NavigationLink(
                    destination: PlanetDetailView(selectedPlanet: planet),
                    label: {
                        Text(planet)
                            .font(.system(size: 20, weight: .light, design: .default))
                    })

            }.navigationTitle("Planets")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
