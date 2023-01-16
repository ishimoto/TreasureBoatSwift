//
//  TBBlurView.swift
//  TB Desktop
//
//  Created by Ken Ishimoto on 2021/02/25.
//

import SwiftUI

#if os(macOS)

@available(OSX 11.0, *)
public struct TBBlurView: NSViewRepresentable {
    
    public init() {
        // ...
    }
    
    public func makeNSView(context: Context) -> some NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }
    
    public func updateNSView(_ nsView: NSViewType, context: Context) {
        // ...
    }
}

#endif
