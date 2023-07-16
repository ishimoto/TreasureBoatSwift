//
//  UIWindow+.swift
//  
//
//  Created by Ken Ishimoto on 2022/08/22.
//

import SwiftUI

@available(iOS 16.0, *)

extension UIWindow {

    // https://zenn.dev/paraches/articles/windows_was_depricated_in_ios15
    public static func firstWindow() -> UIWindow? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window
    }

    public static var isLandscape: Bool {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        return windowScene?.interfaceOrientation.isLandscape ?? false
    }
    
}
