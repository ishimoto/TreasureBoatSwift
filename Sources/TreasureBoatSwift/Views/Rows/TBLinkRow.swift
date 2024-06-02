//
//  TBLinkRow.swift
//  TBToGo
//
//  Created by Ken Ishimoto on 2020/09/06.
//  Copyright © 2020 Ken Ishimoto. All rights reserved.
//

import SwiftUI
import SFSafeSymbols

@available(iOS 14.0, *)
@available(OSX 11.0, *)

public struct TBLinkRow: View {
    
    // MARK: - PROPERTIES
    
    var systemSymbol: SFSymbol
    var color: Color
    var text: String
    var link: String
    
    public init(systemSymbol: SFSymbol, color: Color = .gray, text: String, link: String) {
        self.systemSymbol = systemSymbol
        self.color = color
        self.text = text
        self.link = link
    }

    // MARK: - BODY
    
    public var body: some View {
        HStack {
            
            TBSFSymbol(systemSymbol: systemSymbol,
                       backgroundColor: color,
                       foregroundColor: .white)
            
            Text(LocalizedStringKey(text))
                .foregroundColor(.gray)
            
            Spacer()
            
#if os(iOS)
            
            Button {
                // Open a link
                guard let url = URL(string: self.link), UIApplication.shared.canOpenURL(url) else {
                    return
                }
                UIApplication.shared.open(url as URL)
            } label: {
                Image(systemSymbol: .link)
                    .foregroundStyle(.secondary)
            }
            .accentColor(Color(.systemGray))
            
#elseif os(macOS)
            
            Button {
                // Open a link
                guard let url = URL(string: self.link) else {
                    return
                }
                NSWorkspace.shared.open(url)
            } label: {
                Image(systemSymbol: .chevronRight)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            } //: Button
            .buttonStyle(TBDefaultButtonStyle())
            
#endif
            
        } 
    }
}

// MARK: - PREVIEW

struct TBLinkRow_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            TBLinkRow(systemSymbol: .globe,
                      color: Color.pink,
                      text: "Website",
                      link: "https://www.treasureboat.org")
        }
        .previewLayout(.fixed(width: 375, height: 60))
        .padding()
    }
}
