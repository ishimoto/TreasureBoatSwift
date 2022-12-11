//
//  TBNeumorphicButtonStyle.swift
//  
//
//  Created by Ken Ishimoto on 2022/12/11.
//

import SwiftUI

public struct TBNeumorphicButtonStyle: ButtonStyle {

    var bgColor: Color

    public init(bgColor: Color) {
        self.bgColor = bgColor
    }
        
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .shadow(color: .white, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? -5: -15, y: configuration.isPressed ? -5: -15)
                        .shadow(color: .black, radius: configuration.isPressed ? 7: 10, x: configuration.isPressed ? 5: 15, y: configuration.isPressed ? 5: 15)
                        .blendMode(.overlay)
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(bgColor)
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95: 1)
            .foregroundColor(.primary)
            .animation(.spring(), value: configuration.isPressed)
    }
}
