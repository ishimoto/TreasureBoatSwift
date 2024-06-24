//
//  TBWebViewWithURL.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2020/12/23.
//

#if os(iOS)

import SwiftUI
import WebKit

public struct TBWebViewWithURL: UIViewRepresentable {
    
    let request: URLRequest
    
    public init(request: URLRequest) {
        self.request = request
    }
    
    public func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    public func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.load(request)
    }
        
}
#endif
