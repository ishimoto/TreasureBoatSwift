//
//  TBSFSymbol.swift
//  
//
//  Created by Ken Ishimoto on 2022/08/06.
//

import SwiftUI
import SFSafeSymbols

@available(iOS 14.0, *)
@available(OSX 11.0, *)
public struct TBSFSymbol: View {
    
    var systemName: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    public init(systemName: String, backgroundColor: Color, foregroundColor: Color) {
        self.systemName = systemName
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
    
    public init(systemSymbol: SFSymbol, backgroundColor: Color, foregroundColor: Color) {
        self.systemName = systemSymbol.rawValue
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }

    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(backgroundColor)
            
            Image(systemName: systemName)
                .imageScale(.large)
                .foregroundColor(foregroundColor)
        }
        .frame(width: 36, height: 36, alignment: .center)
    }
}

struct TBSFSymbol_Previews: PreviewProvider {
    static var previews: some View {
        TBSFSymbol(systemName: SFSymbol.gear.rawValue, backgroundColor: .red, foregroundColor: .white)
    }
}
