//
//  TBDefaultButtonStyle.swift
//  
//
//  Created by Ken Ishimoto on 2022/12/11.
//

import SwiftUI

public struct TBDefaultButtonStyle: ButtonStyle {
    
    public init() {
        // ...
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        
        let color = Color.accentColor
        let pressed = configuration.isPressed
        
        return configuration.label
            .font(Font.body.weight(.medium))
            .padding([.leading, .trailing], 8.0)
            .padding([.top], 4.0)
            .padding([.bottom], 5.0)
            .background(color.opacity(pressed ? 0.08 : 0.14))
            .foregroundColor(color.opacity(pressed ? 0.8 : 1.0))
            .cornerRadius(5.0)
        
    }
}
