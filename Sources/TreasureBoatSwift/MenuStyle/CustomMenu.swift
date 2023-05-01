//
//  CustomMenu.swift
//  

import SwiftUI

#if os(iOS) || os(macOS)
public struct CustomMenu: MenuStyle {
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            Menu(configuration)
            Spacer()
            Image(systemSymbol: .chevronUpChevronDown)
        }
        .padding()
        .background(Color.mint)
        .cornerRadius(8)
        .foregroundColor(.white)
    }
}

extension MenuStyle where Self == CustomMenu {
    public static var customMenu: CustomMenu { .init() }
}
#endif
