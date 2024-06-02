//
//  UIColor+.swift
//
//
//  Created by Ken Ishimoto on 2023/08/23.
//

import SwiftUI

#if os(tvOS) || os(iOS) || os(watchOS)

public extension UIColor {
    
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
    var rgbAsHex: String {
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
    var rgbaAsHex: String {
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
    var argbAsHex: String {
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

}

extension UIColor {

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
