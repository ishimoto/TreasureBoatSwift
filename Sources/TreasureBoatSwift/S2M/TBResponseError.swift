//
//  TBResponseError.swift
//  TB To Go iOS
//
//  Created by Ken Ishimoto on 2021/09/12.
//

import Foundation

public struct TBResponseError: Codable {
    public let code: Int
    public let info: String
}
