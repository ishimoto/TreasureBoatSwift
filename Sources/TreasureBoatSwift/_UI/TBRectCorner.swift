//
//  TBRectCorner.swift
//
//
//  Created by Ken Ishimoto on 2024/06/23.
//

import Foundation

public struct TBRectCorner: OptionSet {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let topLeading = TBRectCorner(rawValue: 1 << 0)
    public static let topTrailing = TBRectCorner(rawValue: 1 << 1)
    public static let bottomTrailing = TBRectCorner(rawValue: 1 << 2)
    public static let bottomLeading = TBRectCorner(rawValue: 1 << 3)
    
    public static let all: TBRectCorner = [.topLeading, .topTrailing, .bottomTrailing, .bottomLeading]
    
    public static let leading: TBRectCorner = [.topLeading, .bottomLeading]
    public static let trailing: TBRectCorner = [.topTrailing, .bottomTrailing]
    public static let top: TBRectCorner = [.topLeading, .topTrailing]
    public static let bottom: TBRectCorner = [ .bottomTrailing, .bottomLeading]
}
