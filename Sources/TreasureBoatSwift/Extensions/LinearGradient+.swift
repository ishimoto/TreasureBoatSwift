//
//  LinearGradient+.swift
//  
//
//  Created by Ken Ishimoto on 2022/12/11.
//

import SwiftUI

extension LinearGradient {
    
    public static let blackOpacityGradiant = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0), Color.black.opacity(0.95)]),
                                                     startPoint: .top,
                                                     endPoint: .bottom
    )
    
}
