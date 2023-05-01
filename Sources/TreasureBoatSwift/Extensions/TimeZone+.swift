//
//  File.swift
//  
//
//  Created by Ken Ishimoto on 2023/04/17.
//

import Foundation

extension TimeZone {
    
    public var formattedName: String {
        let start = localizedName(for: .generic, locale: .current) ?? "Unknown"
        return "\(start) - \(identifier)"
    }

    public var localizedFormattedName: String {
        return localizedName(for: .generic, locale: .current) ?? "Unknown"
    }

}
