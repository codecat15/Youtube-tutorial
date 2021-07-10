//
//  AnimalViewModel.swift
//  LazyLoadingDemo
//
//  Created by CodeCat15 on 7/4/21.
//

import Foundation

class AnimalViewModel : ObservableObject {
    @Published var animals : Array<Animal> = Array<Animal>()

    private let resource: AnimalResource = AnimalResource()

    func getAnimal() {
        resource.getAnimalList { [weak self] response in
            if(response?.errorMessage?.isEmpty == true && response?.data != nil){
                DispatchQueue.main.async {
                    self?.animals.append(contentsOf: response?.data ?? [])
                }
            }
        }
    }
}
