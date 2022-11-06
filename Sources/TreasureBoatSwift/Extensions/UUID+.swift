//
//  UUID+.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/16.
//

import Foundation

extension UUID {
    
    public static func isValid(_ uuid: String?) -> Bool {
        if ((uuid?.isEmpty) != nil) {
            return false
        }
        
        if uuid?.count == 36 {
            if UUID(uuidString: uuid!) != nil {
                return true
            }
        }
        return false
    }

}