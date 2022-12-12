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

public struct TitleModifier: ViewModifier {
    
    
    public init() {
        // ...
    }


    public func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
            .foregroundColor(.accentColor)
            .padding(8)
    }
}

#if os(iOS)

public struct TBFieldModifier: ViewModifier {
    
    
    public init() {
        // ...
    }


    public func body(content: Content) -> some View {
        content
            .textFieldStyle(.plain)
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.gray.opacity(0.25))
            .cornerRadius(10)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
    }
}

public struct TBiPhoneTopNotchModifier: ViewModifier {
    
    
    public init() {
        // ...
    }


    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, TBDevice.topNotchHeight())
    }
}

#endif
