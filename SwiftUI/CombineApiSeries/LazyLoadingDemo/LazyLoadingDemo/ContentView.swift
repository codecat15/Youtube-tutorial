//
//  ContentView.swift
//  LazyLoadingDemo
//
//  Created by CodeCat15 on 7/3/21.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var animalViewModel = AnimalViewModel()

    var body: some View {
        List(animalViewModel.animals, id:\.id){ animal in
            HStack{
               LazyImage(imageUrl: animal.image)

                Text(animal.name)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }.padding()
        }.onAppear(perform: {
            animalViewModel.getAnimal()
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
