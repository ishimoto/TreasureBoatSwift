//
//  GradientStyle.swift
//

import SwiftUI

public struct GradientStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled
    private let colors: [Color]
    
    public init(colors: [Color] = [.mint.opacity(0.6), .mint, .mint.opacity(0.6), .mint]) {
        self.colors = colors
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
        }
        .font(.body.bold())
        .foregroundColor(isEnabled ? .white : .black)
        .padding()
        .frame(height: 44)
        .background(backgroundView(configuration: configuration))
        .cornerRadius(10)
    }
    
    @ViewBuilder private func backgroundView(configuration: Configuration) -> some View {
        if !isEnabled {
            disabledBackground
        } else if configuration.isPressed {
            pressedBackground
        } else {
            enabledBackground
        }
    }
    
    private var enabledBackground: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    private var disabledBackground: some View {
        LinearGradient(
            colors: [.gray],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
    
    private var pressedBackground: some View {
        LinearGradient(
            colors: colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .opacity(0.4)
    }
}

extension ButtonStyle where Self == GradientStyle {
    public static var gradient: GradientStyle { .init() }
}
