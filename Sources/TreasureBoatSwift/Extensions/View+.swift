//
//  View+.swift
//  
//
//  Created by Ken Ishimoto on 2022/07/02.
//

import SwiftUI

extension View {
    
    public func center() -> some View {
        HStack {
            Spacer()
            self
            Spacer()
        }
    }
    
    
    /// DEPRECATED : use embedNavigationStack
    public func embedNavigationView() -> some View {
        return NavigationStack { self }
    }

    public func embedNavigationStack() -> some View {
        return NavigationStack { self }
    }

#if os(macOS)
    public func screenRect() -> CGRect {
        return NSScreen.main!.visibleFrame
    }
#elseif os(iOS) || os(tvOS)
    public func screenRect() -> CGRect {
        return UIScreen.main.bounds
    }
#endif
    
    public func safeAreaBottom() -> CGFloat {
#if os(iOS)
        return UIWindow.firstWindow()?.safeAreaInsets.bottom ?? 10
#else
        return 10
#endif
    }
    
    func isMacOS()->Bool{
        return TBDevice.isMac()
    }
    
#if os(iOS)
    public func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
#endif
    
}
