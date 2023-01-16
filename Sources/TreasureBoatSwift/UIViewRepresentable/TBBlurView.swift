//
//  TBBlurView.swift
//  TB Desktop
//
//  Created by Ken Ishimoto on 2021/02/25.
//

import SwiftUI

#if os(iOS)

@available(iOS 14.0, *)
public struct TBBlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    public init() {
        // ...
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // ...
    }
}

#endif


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
