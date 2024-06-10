//
//  DecodingError.swift
//
//
//  Created by Ken Ishimoto on 2024/06/10.
//

import Foundation

extension DecodingError {
    
    public var description: String? {
        switch self {
        case .typeMismatch(_ , let value):
            return "typeMismatch error: \(value.debugDescription)  \(self.localizedDescription)"
        case .valueNotFound(_ , let value):
            return "valueNotFound error: \(value.debugDescription)  \(self.localizedDescription)"
        case .keyNotFound(_ , let value):
            return "keyNotFound error: \(value.debugDescription)  \(self.localizedDescription)"
        case .dataCorrupted(let key):
            return "dataCorrupted error at: \(key)  \(self.localizedDescription)"
        default:
            return "decoding error: \(self.localizedDescription)"
        }
    }
    
}
