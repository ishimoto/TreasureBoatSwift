//
//  Material+.swift
//
//
//  Created by Ken Ishimoto on 2024/06/23.
//

import SwiftUI

public extension Material {
    
    static func style(_ material: Material, height: CGFloat = 50) -> some View {
        Color.clear.background(material)
            .frame(height: height)
    }
    
    static func telop(_ material: Material, height: CGFloat = 50, title: String) -> some View {
        VStack {
            Spacer()
            ZStack {
                Color.clear.background(material)
                    .frame(height: height)
                HStack {
                    Text(title)
                        .font(.title)
                        .padding(.leading, 25)
                    Spacer()
                }
            }
        }
    }

}
