//
//  TBKeyValueModel.swift
//  TB To Go iOS
//
//  Created by Ken Ishimoto on 2021/10/15.
//

import SwiftUI

// MARK: - TBKeyValueResponse (The Response from the Server)

public struct TBKeyValueResponse: Codable {
    
    /** `TBResponse` */
    
    public let success: Bool
    public let error: TBResponseError
    public let javaClass: String?
    public let count: Int?
    public let version: Int?
    public let navVersion: Int?
    public let message: String?
    public let keyValues: [TBKeyValueData]
    
    private enum CodingKeys: String, CodingKey {
        case success = "success"
        case error = "error"
        case javaClass = "javaClass"
        case count = "count"
        case version = "version"
        case navVersion = "navVersion"
        case keyValues = "data"
        case message = "message"
    }
    
}

// MARK: - TBKeyValueData (The Data Model)

public struct TBKeyValueData: Codable {
    
    public let key: String
    public let value: String
    
    private enum CodingKeys: String, CodingKey {
        case key = "key"
        case value = "value"
    }
    
}
