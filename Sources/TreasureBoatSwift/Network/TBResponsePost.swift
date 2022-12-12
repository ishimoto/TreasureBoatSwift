//
//  TBResponsePost.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/09/17.
//

import Foundation

public struct TBResponsePost: Codable {
    
    public let success: Bool
    public let error: TBResponseError
    public let javaClass: String?
    public let count: Int?
    public let version: Int?
    public let navVersion: Int?
    public let message: String?
    
}
