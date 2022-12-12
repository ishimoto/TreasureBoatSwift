//
//  NSPredicate+.swift
//  
//
//  Created by Ken Ishimoto on 2020/08/20.
//

import Foundation
import CoreData

extension NSPredicate {
    
    public func and(qualifier: NSPredicate) -> NSCompoundPredicate {
        return NSCompoundPredicate(andPredicateWithSubpredicates: [self, qualifier])
    }
    
    public func or(qualifier: NSPredicate) -> NSCompoundPredicate {
        return NSCompoundPredicate(orPredicateWithSubpredicates: [self, qualifier])
    }
    
}


