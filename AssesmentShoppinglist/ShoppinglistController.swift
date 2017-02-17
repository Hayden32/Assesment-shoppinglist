//
//  ShoppinglistController.swift
//  AssesmentShoppinglist
//
//  Created by Hayden Hastings on 2/17/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation
import CoreData

class ShoppinglistController {
    
    
    static let shared = ShoppinglistController()
    
    
    // CRUD
    
    // Create
    func createShoppinglist(list: String) {
        let shoppinglist = Shoppinglist(list: list)
        saveToPersistantStore()
    }
    
    
    // Read
    
    var list: [Shoppinglist] {
        let request: NSFetchRequest<Shoppinglist> = Shoppinglist.fetchRequest()
        let moc = Stack.context
        do {
            return try moc.fetch(request)
        } catch {
            return []
        }
        
        
    }
    
    // Update
    
    func update(list: Shoppinglist) {
        list.inCart = !list.inCart
        saveToPersistantStore()
    }
    
    // Delete
    func delete(list: Shoppinglist) {
        let moc = Stack.context
        moc.delete(list)
        saveToPersistantStore()
    }
    
    
}

func saveToPersistantStore() {
    let moc = Stack.context
    do {
        try moc.save()
    } catch {
        print("Could not save managed object context")
    }
}
