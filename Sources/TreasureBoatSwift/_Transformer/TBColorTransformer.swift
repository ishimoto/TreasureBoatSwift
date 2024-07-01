//
//  TBColorTransformer.swift
//
//
//  Created by Ken Ishimoto on 2024/06/30.
//

import SwiftUI

public class TBColorTransformer : ValueTransformer {
    
    // Color => Data
    public override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? Color else {
            return nil
        }

        do {
            return try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
        } catch {
            return nil
        }
    }

    
    // Data => Color
    public override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else {
            return nil
        }
        
        do {
            if let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) {
                return Color(uiColor: color)
            }
        } catch {
            // ...
        }
        return nil
    }
    
    public static func encodeColor(color: Color) throws -> Data {
        let platformColor = UIColor(color)
        return try NSKeyedArchiver.archivedData(
            withRootObject: platformColor,
            requiringSecureCoding: true
        )
    }
    
    public static func decodeColor(from data: Data, defaultColor: Color = .clear) throws -> Color {
        guard let platformColor = try NSKeyedUnarchiver
            .unarchivedObject(ofClass: UIColor.self, from: data)
        else {
            return defaultColor
        }
        return Color(uiColor: platformColor)
    }

}
