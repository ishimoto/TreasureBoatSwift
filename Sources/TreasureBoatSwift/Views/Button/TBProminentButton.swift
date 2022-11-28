//
//  TBProminentButton.swift
//  
//
//  Created by Ken Ishimoto on 2022/11/28.
//

import SwiftUI
import SFSafeSymbols

public struct TBProminentButton: View {
    
    // MARK: - PROPERTIES
    
    var title: String
    var systemSymbol: SFSymbol
    var color: Color
    var fontColor: Color
    
    public init(title: String, systemSymbol: SFSymbol, color: Color = .gray, fontColor: Color = .white) {
        self.title = title
        self.systemSymbol = systemSymbol
        self.color = color
        self.fontColor = fontColor
    }
    
    // MARK: - BODY
    
    public var body: some View {
        
        Label(title, systemSymbol: systemSymbol)
            .modifier(CenterModifier())
            .font(.title2)
            .padding(12)
            .background(color)
            .foregroundColor(fontColor)
            .cornerRadius(5)
            .padding(.horizontal, 20)
            .padding(.top, 7)
            .padding(.bottom, 5)
    }
}

struct TBProminentButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TBProminentButton(title: "Title", systemSymbol: SFSymbol.link , color: .red, fontColor: .white)
                .previewLayout(.sizeThatFits)
            TBProminentButton(title: "Title", systemSymbol: SFSymbol.link, color: .red, fontColor: .black)
                .previewLayout(.sizeThatFits)
        }
    }
}
