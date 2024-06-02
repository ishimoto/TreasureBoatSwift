//
//  iOSView+.swift
//
//
//  Created by Ken Ishimoto on 2023/11/18.
//

import SwiftUI

#if os(iOS)

public extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }

    func screenRect() -> CGRect {
        return UIScreen.main.bounds
    }

    func safeAreaBottom() -> CGFloat {
        return UIWindow.firstWindow()?.safeAreaInsets.bottom ?? 10
    }

}

#endif
