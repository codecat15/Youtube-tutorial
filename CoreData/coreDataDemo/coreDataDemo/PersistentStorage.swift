//
//  PersistentStorage.swift
//  coreDataDemo
//
//  Created by CodeCat15 on 6/12/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import Foundation
import CoreData

/**
 Hey there, I hope you enjoyed the video, if you have any questions then please feel free to ask I will be happy to answer them.

 Do share this with your iOS group on whatsapp or facebook or anyone who wants to learn iOS*/

final class PersistentStorage
{

    private init(){}
    static let shared = PersistentStorage()

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "coreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support

    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
