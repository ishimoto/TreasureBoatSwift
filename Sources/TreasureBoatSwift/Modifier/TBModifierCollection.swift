//
//  TBModifierCollection.swift
//  
//
//  Created by Ken Ishimoto on 2022/11/28.
//

import SwiftUI

public struct CenterModifier: ViewModifier {
    
    public init() {
        // ...
    }
    
    public func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

public struct HStackModifier: ViewModifier {
    
    public init() {
        // ...
    }

    public func body(content: Content) -> some View {
        HStack {
            content
        }
    }
}

public struct VStackModifier: ViewModifier {
    
    public init() {
        // ...
    }

    public func body(content: Content) -> some View {
        VStack {
            content
        }
    }
}

public struct ZStackModifier: ViewModifier {
    
    public init() {
        // ...
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
        }
    }
}
