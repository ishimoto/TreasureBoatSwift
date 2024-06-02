//
//  macOSView+.swift
//
//
//  Created by Ken Ishimoto on 2023/11/18.
//

import SwiftUI

#if os(macOS)

public extension View {
    
    func screenRect() -> CGRect {
        return NSScreen.main!.visibleFrame
    }

    func safeAreaBottom() -> CGFloat {
        return 10
    }

}

#endif
