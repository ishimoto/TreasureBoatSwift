//
//  TBProminentButtonStyle.swift
//  
//
//  Created by Ken Ishimoto on 2023/05/01.
//

import SwiftUI
import SFSafeSymbols

//FIXME nned more work
public struct TBProminentButtonStyle: ButtonStyle {
    
    //@Environment(\.isEnabled) private var isEnabled

    // MARK: - PROPERTIES
    
    private let title: String
    private let systemSymbol: SFSymbol
    private let color: Color
    private let fontColor: Color

    public init(title: String = "Title", systemSymbol: SFSymbol = .checkmark, color: Color = .gray, fontColor: Color = .white) {
        self.title = title
        self.systemSymbol = systemSymbol
        self.color = color
        self.fontColor = fontColor
    }

    public func makeBody(configuration: Configuration) -> some View {
    
        let color = Color.accentColor
        let pressed = configuration.isPressed

        HStack {
            Image(systemSymbol: systemSymbol)
            configuration.label
        }
        .center()
        .font(.title2)
        .padding(12)
        .background(color.opacity(pressed ? 0.08 : 0.14))
        .foregroundColor(fontColor.opacity(pressed ? 0.8 : 1.0))
        .cornerRadius(5)
        .padding(.horizontal, 20)
        .padding(.top, 7)
        .padding(.bottom, 5)
    }
}

extension ButtonStyle where Self == TBProminentButtonStyle {
    public static var treasureBoatProminent: Self { .init() }
}
