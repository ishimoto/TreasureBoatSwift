//
//  CustomKeyValueModel.swift
//  TB To Go iOS
//
//  Created by Ken Ishimoto on 2021/10/15.
//

import SwiftUI
import TreasureBoatSwift

// MARK: - CustomKeyValueResponse (The Response from the Server)

struct CustomKeyValueResponse: Codable {
    
    /** `TBResponse` */
    
    let success: Bool
    let error: TBResponseError
    let javaClass: String?
    let count: Int?
    let version: Int?
    let navVersion: Int?
    let message: String?
    let keyValues: [CustomKeyValue]
    
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

// MARK: - CustomKeyValue (The Data Model)

struct CustomKeyValue: Codable {
    
    let key: String
    let value: String
    
    private enum CodingKeys: String, CodingKey {
        case key = "key"
        case value = "value"
    }
    
}
