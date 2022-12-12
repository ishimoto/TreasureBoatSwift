//
//  TBResponse.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/09/12.
//

import Foundation

public struct TBResponse: Codable {
    
    public let success: Bool
    public let error: TBResponseError
    public let javaClass: String?
    public let count: Int?
    public let version: Int?
    public let navVersion: Int?
        
    /* Mapping in the case the json title's are different */
    private enum CodingKeys: String, CodingKey {
        case success = "success"
        case error = "error"
        case javaClass = "javaClass"
        case count = "count"
        case version = "version"
        case navVersion = "navVersion"
    }
}
