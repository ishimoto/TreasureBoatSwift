//
//  TBHUDView.swift
//  HUDSample
//
//  Created by Ken Ishimoto on 2023/06/10.
//

import SwiftUI

struct TBHUDView<Content: View>: View {
    
    @StateObject private var hud = TBHUD()
    
    let disablesContent: Bool
    @ViewBuilder var content: () -> Content
    
    var body: some View {
            ZStack(alignment: .top) {
                content()
                    .disabled(disablesContent ? hud.isPresented : disablesContent)
                
                if hud.isPresented {
                    
                    HStack(spacing: 13) {
                        Image(systemName: hud.systemImage)
                            .foregroundColor(hud.systemImageColor)
                        
                        VStack {
                            Text(hud.title)
                            if !hud.subtitle.isEmpty {
                                Text(hud.subtitle)
                                    .foregroundColor(.gray)
                            }
                        }
                        .bold()
                        .font(.caption)
                    }
                    .padding(.horizontal, 36)
                    .padding(.vertical, 12)
#if os(iOS)
                    .background {
                        Capsule()
                            .foregroundColor(.secondarySystemBackground)
                    }
#elseif os(macOS)
                    .background(.regularMaterial, in: Capsule())
#endif
                    .padding(.top)
                    .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
                    .zIndex(1)
                }
            }
            .environmentObject(hud)
    }
}

extension View {
    public func hud(disablesContent: Bool = false) -> some View {
        TBHUDView(disablesContent: disablesContent) {
            self
        }
    }
}
