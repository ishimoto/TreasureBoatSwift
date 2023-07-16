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

extension Color {
    
#if os(tvOS) || os(iOS) || os(macOS)

    // MARK: - AccentColor

    public static let tbAccentColor: Color = Color(assetName: TBConstant.AccentColor.nameForAccentColor)

    // MARK: - Shadow
    
    public static let lightShadow = Color(red: 255/255, green: 255/255, blue: 255/255)
    public static let darkShadow = Color(red: 163/255, green: 177/255, blue: 198/255)
    
    public static let blackTransparentLight: Color = Color(assetName: TBConstant.Shadow.nameForBlackTransparentLight)
    public static let blacktransparentDark: Color = Color(assetName: TBConstant.Shadow.nameForBlacktransparentDark)    
    
    // MARK: - TB Colors

    public static let daikoku: Color = Color(assetName: TBConstant.Color.nameForDaikoku)
    public static let daikokuLight: Color = Color(assetName: TBConstant.Color.nameForDaikokuLight)
    public static let daikokuTextColor: Color = daikoku.suitingTextColor()
    public static let daikokuGradient: [Color] = [daikokuLight, daikoku]

    public static let ebisu: Color = Color(assetName: TBConstant.Color.nameForEbisu)
    public static let ebisuLight: Color = Color(assetName: TBConstant.Color.nameForEbisuLight)
    public static let ebisuTextColor: Color = ebisu.suitingTextColor()
    public static let ebisuGradient: [Color] = [ebisuLight, ebisu]

    public static let bishamonten: Color = Color(assetName: TBConstant.Color.nameForBishamonten)
    public static let bishamontenLight: Color = Color(assetName: TBConstant.Color.nameForBishamontenLight)
    public static let bishamontenTextColor: Color = bishamonten.suitingTextColor()
    public static let bishamontenGradient: [Color] = [bishamontenLight, bishamonten]

    public static let benzaiten: Color = Color(assetName: TBConstant.Color.nameForBenzaiten)
    public static let benzaitenLight: Color = Color(assetName: TBConstant.Color.nameForBenzaitenLight)
    public static let benzaitenTextColor: Color = benzaiten.suitingTextColor()
    public static let benzaitenGradient: [Color] = [benzaitenLight, benzaiten]

    public static let fukurokuju: Color = Color(assetName: TBConstant.Color.nameForFukurokuju)
    public static let fukurokujuLight: Color = Color(assetName: TBConstant.Color.nameForFukurokujuLight)
    public static let fukurokujuTextColor: Color = fukurokuju.suitingTextColor()
    public static let fukurokujuGradient: [Color] = [fukurokujuLight, fukurokuju]

    public static let jurōjin: Color = Color(assetName: TBConstant.Color.nameForJurōjin)
    public static let jurōjinLight: Color = Color(assetName: TBConstant.Color.nameForFJurōjinLight)
    public static let jurōjinTextColor: Color = jurōjin.suitingTextColor()
    public static let jurōjinGradient: [Color] = [jurōjinLight, jurōjin]

    public static let budai: Color = Color(assetName: TBConstant.Color.nameForBudai)
    public static let budaiLight: Color = Color(assetName: TBConstant.Color.nameForBudaiLight)
    public static let budaiTextColor: Color = jurōjin.suitingTextColor()
    public static let budaiGradient: [Color] = [budaiLight, budai]

#endif

    // MARK: - Color Extension

#if os(tvOS) || os(iOS)
    
    /// Get the  Color form the Media Asset Catalog (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the color from this Bundle
    /// - Returns: The Color.
    public init(assetName: String) {
        let uiColor = UIColor(named: assetName, in: .module, compatibleWith: .none)
        if uiColor == nil {
            self.init(uiColor: .red)
            return
        }
        self.init(uiColor: uiColor!)
    }
    
#endif

#if os(tvOS) || os(iOS) || os(watchOS)

    /// Make a color 20% darker
    /// - Returns: a 20% darker Color.
    public static func darkerButtonTextColor(_ color: Color) -> Color {
        let uiColor: UIColor = UIColor(color)
        let darkenColor: Color = uiColor.darkerColor(componentDelta: 0.2)
        return darkenColor
    }
    
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        Scanner(string: hex)
            .scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
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
    
    /// Transform a UIColor into a `rgb` Hex string
    /// - Returns: The hex string.
    public var rgbAsHex: String {
        return UIColor(self).rgbAsHex
    }
    
    /// Transform a UIColor into a `rgba` Hex string
    /// - Returns: The hex string.
    public var rgbaAsHex: String {
        return UIColor(self).rgbaAsHex
    }
    
    /// Transform a UIColor into a `argb` Hex string
    /// - Returns: The hex string.
    public var argbAsHex: String {
        return UIColor(self).argbAsHex
    }
    
    /// Check if the Color is a dark color
    /// - Returns: true if the color is a dark color.
    public var isDark: Bool {
        return UIColor(self).isDark
    }
    
    public func suitingTextColor() -> Color {
        let uiColor: UIColor = UIColor(self)
        return uiColor.isDark
            ? Color(uiColor.lighter(componentDelta: 0.45))
            : Color(uiColor.darker(componentDelta: 0.45))
    }
    
#elseif os(macOS)
    
    /// Get the  Color form the Media Asset Catalog (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the color from this Bundle
    /// - Returns: The Color.
    public init(assetName: String) {
        let nsColor = NSColor(named: assetName, bundle: .module)
        if let nsColor {
            self.init(nsColor: nsColor)
            return
        }
        self.init(nsColor: .red)
    }
    
    /// Make a color 20% darker
    /// - Returns: a 20% darker Color.
    public static func darkerButtonTextColor(_ color: Color) -> Color {
        let nsColor: NSColor = NSColor(color)
        let darkenColor: Color = nsColor.darkerColor(componentDelta: 0.2)
        return darkenColor
    }

    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        
        Scanner(string: hex)
            .scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
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

    /// Transform a UIColor into a `rgb` Hex string
    /// - Returns: The hex string.
    public var rgbAsHex: String {
        return NSColor(self).rgbAsHex
    }
    
    /// Transform a UIColor into a `rgba` Hex string
    /// - Returns: The hex string.
    public var rgbaAsHex: String {
        return NSColor(self).rgbaAsHex
    }
    
    /// Transform a UIColor into a `argb` Hex string
    /// - Returns: The hex string.
    public var argbAsHex: String {
        return NSColor(self).argbAsHex
    }
    
    /// Check if the Color is a dark color
    /// - Returns: true if the color is a dark color.
    public var isDark: Bool {
        return NSColor(self).isDark
    }
    
    public func suitingTextColor() -> Color {
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

// MARK: - UIColor Extension

#if os(tvOS) || os(iOS) || os(watchOS)

extension UIColor {
    
    /// Transform a UIColor into each of the color attributes
    /// - Returns: a tuple with `red`, `green`,  `blue` and `alpha`
    private var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
    /// Transform a UIColor into a `rgb` Hex string
    /// - Returns: The hex string.
    public var rgbAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        
        var hexString = String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        return hexString
    }
    
    /// Transform a UIColor into a `rgba` Hex string
    /// - Returns: The hex string.
    public var rgbaAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        let alphaAsInt = Int(round(rgba.alpha * 255))
        
        var hexString = String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        hexString += String(format: "%02X", alphaAsInt)
        return hexString
    }
    
    /// Transform a UIColor into a `argb` Hex string
    /// - Returns: The hex string.
    public var argbAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        let alphaAsInt = Int(round(rgba.alpha * 255))
        
        var hexString = String(format: "%02X", alphaAsInt)
        hexString += String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        return hexString
    }
    
    public var isDark: Bool {
        let lum = 0.2126 * rgba.red + 0.7152 * rgba.green + 0.0722 * rgba.blue
        return lum < 0.50
    }
    
    /* Safely Add RGBA Component Values */
    
    /**
     * Each color component value must be between `0` and `1`.
     * To ensure adding a `componentDelta` does not result in a value less than `0` or greater than `1`, use the following function:
     */
    private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
        // Add value to component ensuring the result is between 0 and 1
        return max(0, min(1, toComponent + value))
    }
    
    /* Make Color Variations */
    
    /**
     * The first step is to extract red, green, blue, and alpha components from the current UIColor.
     * Then, to each color component, add a componentDelta to make the color lighter or darker.
     * Each color component value is between `0` and `1`.
     */
    private func makeColor(componentDelta: CGFloat) -> UIColor {
        // @see https://www.hackingwithswift.com/example-code/uicolor/how-to-read-the-red-green-blue-and-alpha-color-components-from-a-uicolor
        
        // Create a new UIColor modifying each component
        // by componentDelta, making the new UIColor either
        // lighter or darker.
        return UIColor(
            red: add(componentDelta, toComponent: rgba.red),
            green: add(componentDelta, toComponent: rgba.green),
            blue: add(componentDelta, toComponent: rgba.blue),
            alpha: rgba.alpha
        )
    }
    
    /* Make A UIColor Lighter, Darker */
    
    /**
     * The makes the color lighter
     * Modify the `componentDelta` value to control how much lighter  the resulting `UIColor` is.
     */
    public func lighter(componentDelta: CGFloat = 0.1) -> UIColor {
        return makeColor(componentDelta: componentDelta)
    }
    
    /**
     * The makes the color darker
     * Modify the `componentDelta` value to control how much darker  the resulting `UIColor` is.
     */
    public func darker(componentDelta: CGFloat = 0.1) -> UIColor {
        return makeColor(componentDelta: -1 * componentDelta)
    }
    
    /**
     * The makes the color lighter
     * Modify the `componentDelta` value to control how much lighter  the resulting `Color` is.
     */
    public func lighterColor(componentDelta: CGFloat = 0.1) -> Color {
        return Color(lighter(componentDelta: componentDelta))
    }
    
    /**
     * The makes the color darker
     * Modify the `componentDelta` value to control how much darker  the resulting `Color` is.
     */
    public func darkerColor(componentDelta: CGFloat = 0.1) -> Color {
        return Color(darker(componentDelta: componentDelta))
    }
    
}

#endif

// MARK: - NSColor Extension

#if os(macOS)

extension NSColor {
    
    /// Transform a NSColor into each of the color attributes
    /// - Returns: a tuple with `red`, `green`,  `blue` and `alpha`
    private var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
    
    /// Transform a NSColor into a `rgb` Hex string
    /// - Returns: The hex string.
    public var rgbAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        
        var hexString = String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        return hexString
    }
    
    /// Transform a NSColor into a `rgba` Hex string
    /// - Returns: The hex string.
    public var rgbaAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        let alphaAsInt = Int(round(rgba.alpha * 255))
        
        var hexString = String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        hexString += String(format: "%02X", alphaAsInt)
        return hexString
    }
    
    /// Transform a NSColor into a `argb` Hex string
    /// - Returns: The hex string.
    public var argbAsHex: String {
        let redAsInt = Int(round(rgba.red * 255))
        let greenAsInt = Int(round(rgba.green * 255))
        let blueAsInt = Int(round(rgba.blue * 255))
        let alphaAsInt = Int(round(rgba.alpha * 255))
        
        var hexString = String(format: "%02X", alphaAsInt)
        hexString += String(format: "%02X", redAsInt)
        hexString += String(format: "%02X", greenAsInt)
        hexString += String(format: "%02X", blueAsInt)
        return hexString
    }
    
    public var isDark: Bool {
        let lum = 0.2126 * rgba.red + 0.7152 * rgba.green + 0.0722 * rgba.blue
        return lum < 0.50
    }
    
    /* Safely Add RGBA Component Values */
    
    /**
     * Each color component value must be between `0` and `1`.
     * To ensure adding a `componentDelta` does not result in a value less than `0` or greater than `1`, use the following function:
     */
    private func add(_ value: CGFloat, toComponent: CGFloat) -> CGFloat {
        // Add value to component ensuring the result is between 0 and 1
        return max(0, min(1, toComponent + value))
    }
    
    /* Make Color Variations */
    
    /**
     * The first step is to extract red, green, blue, and alpha components from the current UIColor.
     * Then, to each color component, add a componentDelta to make the color lighter or darker.
     * Each color component value is between `0` and `1`.
     */
    private func makeColor(componentDelta: CGFloat) -> NSColor {
        // @see https://www.hackingwithswift.com/example-code/uicolor/how-to-read-the-red-green-blue-and-alpha-color-components-from-a-uicolor
        
        // Create a new UIColor modifying each component
        // by componentDelta, making the new UIColor either
        // lighter or darker.
        return NSColor(
            red: add(componentDelta, toComponent: rgba.red),
            green: add(componentDelta, toComponent: rgba.green),
            blue: add(componentDelta, toComponent: rgba.blue),
            alpha: rgba.alpha
        )
    }
    
    /* Make A UIColor Lighter, Darker */
    
    /**
     * The makes the color lighter
     * Modify the `componentDelta` value to control how much lighter  the resulting `NSColor` is.
     */
    public func lighter(componentDelta: CGFloat = 0.1) -> NSColor {
        return makeColor(componentDelta: componentDelta)
    }
    
    /**
     * The makes the color darker
     * Modify the `componentDelta` value to control how much darker  the resulting `NSColor` is.
     */
    public func darker(componentDelta: CGFloat = 0.1) -> NSColor {
        return makeColor(componentDelta: -1 * componentDelta)
    }
    
    /**
     * The makes the color lighter
     * Modify the `componentDelta` value to control how much lighter  the resulting `Color` is.
     */
    public func lighterColor(componentDelta: CGFloat = 0.1) -> Color {
        return Color(lighter(componentDelta: componentDelta))
    }
    
    /**
     * The makes the color darker
     * Modify the `componentDelta` value to control how much darker  the resulting `Color` is.
     */
    public func darkerColor(componentDelta: CGFloat = 0.1) -> Color {
        return Color(darker(componentDelta: componentDelta))
    }
    
}

#endif
