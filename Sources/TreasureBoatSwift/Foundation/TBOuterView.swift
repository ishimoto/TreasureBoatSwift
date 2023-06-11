//
//  TBOuterView.swift
//  
//
//  Created by Ken Ishimoto on 2023/06/11.
//

import SwiftUI

public struct TBOuterView<Content: View>: View {
    
    @ViewBuilder var content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
        
    public var body: some View {
        NavigationStack {
            content()
        }
        .hud(disablesContent: true)
    }
}
