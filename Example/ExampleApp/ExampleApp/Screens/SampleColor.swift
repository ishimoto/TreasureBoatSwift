//
//  SampleColor.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/10/13.
//

import SwiftUI

struct SampleColor: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Text("Orange")
                .bold()
            Text("rgbAsHex : \(UIColor.orange.rgbAsHex)")
            Text("rgbaAsHex : \(UIColor.orange.rgbaAsHex)")
            Text("argbAsHex : \(UIColor.orange.argbAsHex)")
            Divider()

            Spacer()
        }
        
        .navigationTitle("Color")
    }
    
}

struct SampleColor_Previews: PreviewProvider {
    static var previews: some View {
        SampleColor()
            .embedNavigationView()
    }
}
