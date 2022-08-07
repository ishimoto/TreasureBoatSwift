//
//  TBSimpleFormRow.swift
//
//  Created by Ken Ishimoto on 2020/09/05.
//  Copyright © 2020 Ken Ishimoto. All rights reserved.
//

import SwiftUI
import SFSafeSymbols

@available(iOS 14.0, *)
@available(OSX 11.0, *)
public struct TBSimpleFormRow: View {
    
    // MARK: - PROPERTIES
    
    var systemSymbol: SFSymbol
    var symbolBackgroundColor: Color
    var symbolForegroundColor: Color
    var titleText: String
    var secondaryText: String
    
    public init(systemSymbol: SFSymbol, symbolBackgroundColor: Color = .gray, symbolForegroundColor: Color = .white, titleText: String, secondaryText: String) {
        self.systemSymbol = systemSymbol
        self.symbolBackgroundColor = symbolBackgroundColor
        self.symbolForegroundColor = symbolForegroundColor
        self.titleText = titleText
        self.secondaryText = secondaryText
    }
    
    // MARK: - BODY
    
    public var body: some View {
        
        HStack {
            TBSFSymbol(systemSymbol: systemSymbol,
                       backgroundColor: symbolBackgroundColor,
                       foregroundColor: symbolForegroundColor)
            
            Text(LocalizedStringKey(titleText))
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(secondaryText)
        }
        
    }
}

// MARK: - PREVIEW

struct TBSimpleFormRow_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) { colorScheme in
            Group {
                TBSimpleFormRow(systemSymbol: .gear,
                                    titleText: "Application",
                                    secondaryText: "Todo")
            }
            .preferredColorScheme(colorScheme)
            .previewDisplayName("Color scheme : \(colorScheme)")
        }
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
        
    }
}
