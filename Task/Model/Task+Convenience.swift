//
//  Task+Convenience.swift
//  Task
//
//  Created by Steve Lederer on 12/4/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        
        self.name = name
    }
}
