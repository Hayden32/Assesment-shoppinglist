//
//  Stack.swift
//  AssesmentShoppinglist
//
//  Created by Hayden Hastings on 2/17/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation
import CoreData

class Stack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "AssesmentShoppinglist")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
