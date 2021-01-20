//
//  PlanetDetailView.swift
//  TabbarDemo
//
//  Created by CodeCat15 on 1/19/21.
//

import SwiftUI

struct PlanetDetailView: View {
    var selectedPlanet : String
    var body: some View {
        Text("\(selectedPlanet) detail view")
        .font(.title)
    }
}

struct PlanetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(selectedPlanet: "Earth")
    }
}
