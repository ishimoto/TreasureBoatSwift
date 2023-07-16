//
//  TBDevice.swift
//
//  Created by Ken Ishimoto on 2021/04/28.
//

#if canImport(UIKit)
import UIKit
#endif

import SwiftUI


// To not conflict with other code add the TB identifier
// https://theiphonewiki.com/wiki/Models
// https://theiphonewiki.com/wiki/BORD
public class TBDevice {
    
    static public func isIOS() -> Bool {
#if os(iOS)
        return true
#else
        return false
#endif
    }
    
    static public func isMac() -> Bool {
#if os(iOS) || os(tvOS) || os(watchOS)
        return false
#else
        return true
#endif
    }

#if os(iOS)

    static public func isRetina() -> Bool {
        return UIScreen.main.scale > 1.0
    }
   
    static public func topNotchHeight() -> CGFloat {
        return  UIWindow.firstWindow()?.safeAreaInsets.top ?? .zero;
    }

    static public var isLandscape: Bool {
        return ( UIWindow.isLandscape )
    }
    
    static public var isPortrait: Bool {
        return !isLandscape
    }

#endif
    
}
