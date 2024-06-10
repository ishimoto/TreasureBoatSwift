//
//  String?+.swift
//  
//
//  Created by Ken Ishimoto on 2023/05/01.
//

import Foundation

extension String? {
    
    public var isNilOrEmpty: Bool {
        return self == nil || self != ""
    }

}
