//
//  ETBBackgroundMaterial.swift
//
//
//

import SwiftUI

#if os(iOS) || os(macOS)

public enum ETBBackgroundMaterial {
    
    /// A material that's somewhat translucent.
    case regularMaterial
    
    /// A material that's more opaque than translucent.
    case thickMaterial
    
    /// A material that's more translucent than opaque.
    case thinMaterial
    
    /// A mostly translucent material.
    case ultraThinMaterial
    
    /// A mostly opaque material.
    case ultraThickMaterial
    
    func material() -> Material {
        switch self {
        case .regularMaterial:
            return Material.regularMaterial
        case .thickMaterial:
            return Material.thickMaterial
        case .thinMaterial:
            return Material.thinMaterial
        case .ultraThinMaterial:
            return Material.ultraThinMaterial
        case .ultraThickMaterial:
            return Material.ultraThickMaterial
        }
    }
}

#endif
