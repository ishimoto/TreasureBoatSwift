//
//  Binding+.swift
//
//
//  Created by Ken Ishimoto on 2023/06/11.
//  Thanks to https://betterprogramming.pub/swiftui-binding-extensions-b6a9f27d2858

import SwiftUI

public extension Binding {
    
    /*
     Example :
     class SomeViewModel: ObservableObject {
     @Published var name: String?
     }
     */
    
    /// Set the default value in a Binding for an optional object
    /// ``TextField("Name", text: $viewModel.name.defaultValue(""))``
    func defaultValue<T>(_ value: T) -> Binding<T> where Value == Optional<T> {
        Binding<T> {
            wrappedValue ?? value
        } set: {
            wrappedValue = $0
        }
    }
    
}

public extension Binding where Value == Optional<String> {
    
    /// Set the default value to a String Binding for an optional object
    /// ``TextField("Name", text: $viewModel.name.orEmpty)``
    var orEmpty: Binding<String> {
        Binding<String> {
            wrappedValue ?? ""
        } set: {
            wrappedValue = $0
        }
    }
    
}

public extension Binding {
    // by Alex Nagy on 03.12.2022
    func allowing(predicate: @escaping (Value) -> Bool) -> Self {
        Binding(get: { self.wrappedValue },
                set: { newValue in
            let oldValue = self.wrappedValue
            // Need to force a change to trigger the binding to refresh
            self.wrappedValue = newValue
            if !predicate(newValue) && predicate(oldValue) {
                // And set it back if it wasn't legal and the previous was
                self.wrappedValue = oldValue
            }
        })
    }
}
