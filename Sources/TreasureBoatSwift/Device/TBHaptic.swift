//
//  TBHaptic.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/14.
//

#if os(iOS)

import UIKit

public struct TBHaptic {
    
    private static let haptics = UINotificationFeedbackGenerator()
    
    /// Execute a `success` haptic.
    public static func success() {
        haptics.notificationOccurred(.success)
    }
    
    ///　Execute a `warning` haptic.
    public static func warning() {
        haptics.notificationOccurred(.warning)
    }
    
    /// Execute a `error` haptic.
    public static func error() {
        haptics.notificationOccurred(.error)
    }
    
}

#endif
