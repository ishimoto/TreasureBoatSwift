//
//  Binding+.swift
//  
//
//  Created by Ken Ishimoto on 2023/06/11.
//  Thanks to https://betterprogramming.pub/swiftui-binding-extensions-b6a9f27d2858

import SwiftUI

extension Binding {
    
    /*
     Example :
        class SomeViewModel: ObservableObject {
            @Published var name: String?
        }
     */
    
    /// Set the default value in a Binding for an optional object
    /// ``TextField("Name", text: $viewModel.name.defaultValue(""))``
    public func defaultValue<T>(_ value: T) -> Binding<T> where Value == Optional<T> {
        Binding<T> {
            wrappedValue ?? value
        } set: {
            wrappedValue = $0
        }
    }
    
}

extension Binding where Value == Optional<String> {
    
    /// Set the default value to a String Binding for an optional object
    /// ``TextField("Name", text: $viewModel.name.orEmpty)``
    public var orEmpty: Binding<String> {
        Binding<String> {
            wrappedValue ?? ""
        } set: {
            wrappedValue = $0
        }
    }
    
}

