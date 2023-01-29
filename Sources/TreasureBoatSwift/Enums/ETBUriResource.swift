//
//  ETBUriResource.swift
//  
//
//  Created by Ken Ishimoto on 2023/01/28.
//

import Foundation

public enum ETBUriResource: String, CaseIterable {
    
    case STATIC = "static://"
    case HTTPS = "https://"
    case HTTP = "http://"

    public static func isStatic(_ file: String) -> Bool {
        return file.hasPrefix(ETBUriResource.STATIC.rawValue)
    }

    public static func isHttp(_ file: String) -> Bool {
        return file.hasPrefix(ETBUriResource.HTTP.rawValue)
    }

    public static func isHttps(_ file: String) -> Bool {
        return file.hasPrefix(ETBUriResource.HTTPS.rawValue)
    }

}
