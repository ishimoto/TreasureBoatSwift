//
//  tvOSView+.swift
//
//
//  Created by Ken Ishimoto on 2023/11/18.
//

import SwiftUI

#if os(tvOS)

public extension View {
    
    public func screenRect() -> CGRect {
        return UIScreen.main.bounds
    }

    func safeAreaBottom() -> CGFloat {
        return 10
    }

}

#endif
