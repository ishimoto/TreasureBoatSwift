//
//  TBAppearance.swift
//  
//
//  Created by Ken Ishimoto on 2023/01/15.
//

import SwiftUI


#if os(macOS)

@available(OSX 11.0, *)
public struct TBAppearance {
    
    @AppStorage(TBConstant.AppStorage.AppTheme) var appTheme: ETBAppearance = .system
    
    public func switchTheme() {
        switch appTheme {
        case .dark:
            NSApp.appearance = NSAppearance(named: .darkAqua)
        case .light:
            NSApp.appearance = NSAppearance(named: .aqua)
        default:
            NSApp.appearance = nil
        }
    }
}

#endif
