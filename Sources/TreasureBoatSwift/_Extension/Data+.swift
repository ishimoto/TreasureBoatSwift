//
//  Data+.swift
//  RequesterDemo
//
//  Created by Alex Nagy on 27.07.2022.
//

import Foundation

#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

public extension Data {
    
    func jsonString(pretty: Bool = false) -> String {
        if let json = try? JSONSerialization.jsonObject(with: self, options: .mutableContainers) {
            if pretty, let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                return String(decoding: jsonData, as: UTF8.self)
            } else {
                return String(decoding: self, as: UTF8.self)
            }
        } else {
            return "JSON data is malformed"
        }
    }
    
#if os(iOS) || os(watchOS) || os(tvOS)
    /// データ→イメージに変換する
    ///
    /// - Returns: 変換後のイメージ
    func toImage() -> UIImage {
        guard let image = UIImage(data: self) else {
            print("データをイメージに変換できませんでした。")
            return UIImage()
        }
        return image
    }
#elseif os(macOS)
    /// データ→イメージに変換する
    ///
    /// - Returns: 変換後のイメージ
    func toImage() -> NSImage {
        guard let image = NSImage(data: self) else {
            print("データをイメージに変換できませんでした。")
            return NSImage()
        }
        return image
    }
#endif
}
