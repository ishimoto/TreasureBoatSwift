//
//  ETBHTTPMethod.swift
//  
//
//  Created by Ken Ishimoto on 2023/02/11.
//

import Foundation
import MagicUI

public enum ETBHTTPMethod: String, CaseIterable, Codable {
    
    case get
    case head
    case post
    case put
    case delete
    case patch
    case connect
    case options
    case trace

    public var magicUiHTTPMethod: HTTPMethod {
        switch self {
        case .get:
            return HTTPMethod.get
        case .head:
            return HTTPMethod.head
        case .post:
            return HTTPMethod.post
        case .put:
            return HTTPMethod.put
        case .delete:
            return HTTPMethod.delete
        case .patch:
            return HTTPMethod.patch
        case .connect:
            return HTTPMethod.connect
        case .options:
            return HTTPMethod.options
        case .trace:
            return HTTPMethod.trace
        }
    }
}
