//
//  Color+.swift
//  
//
//  Created by Ken Ishimoto on 2022/08/14.
//

import SwiftUI

@available(iOS 13.0, *)
@available(OSX 11.0, *)
@available(tvOS 16.0, *)
@available(watchOS 9.0, *)

public extension Color {
    
    /// Color from HEX
    /// Example : `FAB`, `#FAB`, `FFAACC`, `#FFAACC`, `FFAACC11` or `#FFAACC11`
    /// - Parameter hex: HEX RGB (12-bit), RGB (24-bit) or ARGB (32-bit)
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)

        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (rgbValue >> 8) * 17, (rgbValue >> 4 & 0xF) * 17, (rgbValue & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, rgbValue >> 16, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (rgbValue >> 24, rgbValue >> 16 & 0xFF, rgbValue >> 8 & 0xFF, rgbValue & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255
        )
    }
    
}

public extension Color {
    
    /// Random color
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

public extension Color {
    
#if os(tvOS) || os(iOS) || os(watchOS)
    
    /// Transform a UIColor into a `rgb` Hex string
    /// - Returns: The hex string.
    var rgbAsHex: String {
        return UIColor(self).rgbAsHex
    }
    
    /// Transform a UIColor into a `rgba` Hex string
    /// - Returns: The hex string.
    var rgbaAsHex: String {
        return UIColor(self).rgbaAsHex
    }
    
    /// Transform a UIColor into a `argb` Hex string
    /// - Returns: The hex string.
    var argbAsHex: String {
        return UIColor(self).argbAsHex
    }
        
#elseif os(macOS)
    
    /// Transform a UIColor into a `rgb` Hex string
    /// - Returns: The hex string.
    var rgbAsHex: String {
        return NSColor(self).rgbAsHex
    }
    
    /// Transform a UIColor into a `rgba` Hex string
    /// - Returns: The hex string.
    var rgbaAsHex: String {
        return NSColor(self).rgbaAsHex
    }
    
    /// Transform a UIColor into a `argb` Hex string
    /// - Returns: The hex string.
    var argbAsHex: String {
        return NSColor(self).argbAsHex
    }
    
#endif
    
}

public extension Color {
    
#if os(tvOS) || os(iOS)
    
    /// Get the  Color form the Media Asset Catalog (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the color from this Bundle
    /// - Returns: The Color.
    init(assetName: String) {
        let uiColor = UIColor(named: assetName, in: .module, compatibleWith: .none)
        if uiColor == nil {
            self.init(uiColor: .red)
            return
        }
        self.init(uiColor: uiColor!)
    }
    
#endif

#if os(macOS)

    /// Get the  Color form the Media Asset Catalog (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the color from this Bundle
    /// - Returns: The Color.
    init(assetName: String) {
        let nsColor = NSColor(named: assetName, bundle: .module)
        if let nsColor {
            self.init(nsColor: nsColor)
            return
        }
        self.init(nsColor: .red)
    }

#endif

}

public extension Color {

#if os(tvOS) || os(iOS) || os(watchOS)

    /// Make a color 20% darker
    /// - Returns: a 20% darker Color.
    static func darkerButtonTextColor(_ color: Color) -> Color {
        let uiColor: UIColor = UIColor(color)
        let darkenColor: Color = uiColor.darkerColor(componentDelta: 0.2)
        return darkenColor
    }
    
    /// Check if the Color is a dark color
    /// - Returns: true if the color is a dark color.
    var isDark: Bool {
        return UIColor(self).isDark
    }
    
    func suitingTextColor() -> Color {
        let uiColor: UIColor = UIColor(self)
        return uiColor.isDark
            ? Color(uiColor.lighter(componentDelta: 0.45))
            : Color(uiColor.darker(componentDelta: 0.45))
    }
    
#elseif os(macOS)
        
    /// Make a color 20% darker
    /// - Returns: a 20% darker Color.
    static func darkerButtonTextColor(_ color: Color) -> Color {
        let nsColor: NSColor = NSColor(color)
        let darkenColor: Color = nsColor.darkerColor(componentDelta: 0.2)
        return darkenColor
    }

    /// Check if the Color is a dark color
    /// - Returns: true if the color is a dark color.
    var isDark: Bool {
        return NSColor(self).isDark
    }
    
    func suitingTextColor() -> Color {
        let nsColor: NSColor = NSColor(self)
        return nsColor.isDark
            ? Color(nsColor.lighter(componentDelta: 0.45))
            : Color(nsColor.darker(componentDelta: 0.45))
    }
    
#elseif os(watchOS)

    /// Check if the Color is a dark color
    /// - Returns: true if the color is a dark color.
     public var isDark: Bool {
        return UIColor(self).isDark
    }

#endif
    
}

#if os(iOS)
import UIKit
/// Color definitions of the UIColor constant colors.
public extension Color {
    // Adaptable colors
    static let systemRed = Color(UIColor.systemRed)
    static let systemGreen = Color(UIColor.systemGreen)
    static let systemBlue = Color(UIColor.systemBlue)
    static let systemOrange = Color(UIColor.systemOrange)
    static let systemYellow = Color(UIColor.systemYellow)
    static let systemPink = Color(UIColor.systemPink)
    static let systemPurple = Color(UIColor.systemPurple)
    static let systemTeal = Color(UIColor.systemTeal)
    static let systemIndigo = Color(UIColor.systemIndigo)
    static let systemBrown = Color(UIColor.systemBrown)
    static let systemMint = Color(UIColor.systemMint)
    static let systemCyan = Color(UIColor.systemCyan)

    // Adaptable grayscales
    static let systemGray = Color(UIColor.systemGray)
    static let systemGray2 = Color(UIColor.systemGray2)
    static let systemGray3 = Color(UIColor.systemGray3)
    static let systemGray4 = Color(UIColor.systemGray4)
    static let systemGray5 = Color(UIColor.systemGray5)
    static let systemGray6 = Color(UIColor.systemGray6)

    // Adaptable text colors
    static let label = Color(UIColor.label)
    static let secondaryLabel = Color(UIColor.secondaryLabel)
    static let tertiaryLabel = Color(UIColor.tertiaryLabel)
    static let quaternaryLabel = Color(UIColor.quaternaryLabel)
    static let link = Color(UIColor.link)
    static let placeholderText = Color(UIColor.placeholderText)
    // Adaptable separators
    static let separator = Color(UIColor.separator)
    static let opaqueSeparator = Color(UIColor.opaqueSeparator)
    // Adaptable backgrounds
    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)
    // Adaptable grouped backgrounds
    static let systemGroupedBackground = Color(UIColor.systemGroupedBackground)
    static let secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    static let tertiarySystemGroupedBackground = Color(UIColor.tertiarySystemGroupedBackground)
    // Adaptable system fills
    static let systemFill = Color(UIColor.systemFill)
    static let secondarySystemFill = Color(UIColor.secondarySystemFill)
    static let tertiarySystemFill = Color(UIColor.tertiarySystemFill)
    static let quaternarySystemFill = Color(UIColor.quaternarySystemFill)
    
    static let lightText = Color(UIColor.lightText)
    static let darkText = Color(UIColor.darkText)

}
#endif

