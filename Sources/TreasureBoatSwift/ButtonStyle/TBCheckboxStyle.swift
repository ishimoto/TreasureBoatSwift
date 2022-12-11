//
//  CheckboxStyle.swift
//  Devote
//
//  Created by Ken Ishimoto on 2021/04/26.
//

import SwiftUI

public struct TBCheckboxStyle: ToggleStyle {
    
    public init() {
        // ...
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        
        let color = Color.accentColor
        
        return HStack {
            Image(systemSymbol: configuration.isOn ? .checkmarkCircleFill : .circle)
                .foregroundColor(configuration.isOn ? color : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    
                    if configuration.isOn {
                        TBAudio.playDing()
                    } else {
                        TBAudio.playClick()
                    }
                    
                }
            
            configuration.label
            
        } //: HStack
    }
}

fileprivate struct CheckboxStyle_Demo: View {
    
    @State private var value = false
    
    var body: some View {
        Toggle("Placeholder label", isOn: $value)
            .toggleStyle(TBCheckboxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
    }
}

struct CheckboxStyle_Previews: PreviewProvider {
    static var previews: some View {
        CheckboxStyle_Demo()
    }
}
