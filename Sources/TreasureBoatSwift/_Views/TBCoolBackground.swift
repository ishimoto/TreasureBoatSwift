//
//  TBCoolBackground.swift
//
//
//  Created by Ken Ishimoto on 2024/06/30.
//

import SwiftUI

#if os(iOS)

public struct TBCoolBackground: View {
    
    public init() {
        
    }
    
    public var body: some View {
        
        ZStack {
            
            LinearGradient(colors: Color.ebisuGradient,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea(.container, edges: .bottom)
            
            GeometryReader{ proxy in
                let size = proxy.size
                
                Color.black
                    .opacity(0.7)
                    .blur(radius: 200)
                    .ignoresSafeArea(.container, edges: .bottom)
                
                Circle()
                    .fill(Color(.purple))
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: -size.width / 1.8,
                            y: (-size.height / 5) + 120)
                
                Circle()
                    .fill(Color(.blue))
                    .padding(50)
                    .blur(radius: 150)
                    .offset(x: size.width / 1.8,
                            y: (-size.height / 5) + 150)

                Circle()
                    .fill(Color(.blue))
                    .padding(50)
                    .blur(radius: 90)
                    .offset(x: size.width / 1.8,
                            y: size.height / 2)
                
                Circle()
                    .fill(Color(.purple))
                    .padding(100)
                    .blur(radius: 110)
                    .offset(x: size.width / 1.8,
                            y: size.height / 2)
                
                Circle()
                    .fill(Color(.purple))
                    .padding(100)
                    .blur(radius: 110)
                    .offset(x: -size.width / 1.8,
                            y: size.height / 2)
                
            }
        }
    }
}

#endif
