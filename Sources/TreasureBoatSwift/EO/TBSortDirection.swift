//
//  TBSortDirection.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/05/28.
//

import Foundation
import CoreData

public enum TBSortDirection: String, CaseIterable {
    
    case ascending = "Ascending"
    case descending = "Descending"
    
    public var value: Bool {
        switch self {
        case .ascending:
            return true
        case .descending:
            return false
        }
    }
    
}
