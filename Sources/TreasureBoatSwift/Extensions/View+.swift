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
    
    public func embedNavigationView() -> some View {
        return NavigationView { self }
    }
    
    public func screenRect() -> CGRect {
#if os(iOS) || os(tvOS)
        return UIScreen.main.bounds
#elseif os(macOS)
        return NSScreen.main!.visibleFrame
#endif
    }
    
    public func safeAreaBottom() -> CGFloat {
#if os(iOS)
        return UIWindow.firstWindow()?.safeAreaInsets.bottom ?? 10
#else
        return 10
#endif
    }
    
    func isMacOS()->Bool{
        return TBCheckDevice.isMac()
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
