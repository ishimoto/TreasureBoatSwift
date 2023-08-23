//
//  NStack.swift
//  NStackBuilder
//
//  Created by Alex Nagy on 06.07.2023.
//

import SwiftUI

public struct NStack<Root: View>: View {
    
    @ViewBuilder var root: () -> Root
    
    var body: some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            NavigationStack {
                root()
            }
        } else {
            NavigationView {
                root()
            }
#if !os(macOS)
            .navigationViewStyle(.stack)
#endif
        }
    }
}

