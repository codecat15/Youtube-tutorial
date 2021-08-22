//
//  CDAnimalExtension.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/15/21.
//

import Foundation

extension CDAnimal {
    func convertToAnimal() -> Animal {
        return Animal(name: self.name!, image: self.image!)
    }
}
