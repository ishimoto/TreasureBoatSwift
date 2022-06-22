//
//  File.swift
//  
//
//  Created by Ken Ishimoto on 2022/06/22.
//

import Foundation

extension String {
    
    // Thanks to @uhooi
    /// Transform Hiragana to Katakana.
    /// - Returns: The transformed string.
    /// - SeeAlso: ``toHiragana()``
    public func toKatakana() -> String? {
        applyingTransform(.hiraganaToKatakana, reverse: false)
    }
    
    // Thanks to @uhooi
    /// Transform Katakana to Hiragana.
    /// - Returns: The transformed string.
    /// - SeeAlso: ``toKatakana()``
    public func toHiragana() -> String? {
        applyingTransform(.hiraganaToKatakana, reverse: true)
    }
    
}
