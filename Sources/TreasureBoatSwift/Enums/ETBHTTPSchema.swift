//
//  ETBHTTPSchema.swift
//  TB Desktop
//
//  Created by Ken Ishimoto on 2023/01/28.
//

import Foundation
import MagicUI

public enum ETBHTTPSchema: String, CaseIterable {
    
    case http
    case https
    
    public var magicUiScheme: Scheme {
        switch self {
        case .http:
            return Scheme.http
        case .https:
            return Scheme.https
        }
    }
}
