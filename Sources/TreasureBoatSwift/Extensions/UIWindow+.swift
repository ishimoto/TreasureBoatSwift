//
//  UIWindow+.swift
//  
//
//  Created by Ken Ishimoto on 2022/08/22.
//

import SwiftUI

#if os(tvOS) || os(iOS)

extension UIWindow {
    
    // https://zenn.dev/paraches/articles/windows_was_depricated_in_ios15
    public static func firstWindow() -> UIWindow? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window
    }
 
    public static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            return windowScene?.interfaceOrientation.isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
   
}

#endif
