//
//  Shoppinglist+Convenience.swift
//  AssesmentShoppinglist
//
//  Created by Hayden Hastings on 2/17/17.
//  Copyright © 2017 Hayden Hastings. All rights reserved.
//

import Foundation
import CoreData

extension Shoppinglist {
    
    @discardableResult convenience init(list: String, inCart: Bool = false, context: NSManagedObjectContext = Stack.context) {
        
        self.init(context: context)
        self.list = list
        self.inCart = inCart
    }
}
