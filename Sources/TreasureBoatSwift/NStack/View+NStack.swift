//
//  View+NStack.swift
//  NStackBuilder
//
//  Created by Alex Nagy on 06.07.2023.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    /// Presents a view when a binding to a Boolean value that you
    /// provide is true.
    /// - Parameters:
    ///   - type: The type of navigation.
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the sheet that you create in the modifier's.
    ///     `destination` closure.
    ///   - onDismiss: The closure to execute when dismissing the `destination`.
    ///   - destination: A closure that returns the content of the `destination`.
    func navigation<Destination: View>(_ type: NavigationType,
                                       isPresented: Binding<Bool>,
                                       onDismiss: (() -> Void)? = nil,
                                       destination: @escaping () -> Destination) -> some View {
        switch type {
        case .link:
            self.modifier(NStackDestinationPresentedModifier(isPresented: isPresented, onDismiss: onDismiss, destination: destination))
        case .sheet:
            self.sheet(isPresented: isPresented, onDismiss: onDismiss) {
                destination()
            }
            #if !os(macOS)
        case .fullScreenCover:
            self.fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
                destination()
            }
            #endif
        }
    }
    
    @ViewBuilder
    /// Presents a view using the given item as a data source
    /// for the `destination`'s content.
    /// - Parameters:
    ///   - type: The type of navigation.
    ///   - item: A binding to an optional source of truth for the `destination`.
    ///     When `item` is non-`nil`, the system passes the item's content to
    ///     the modifier's closure. You display this content in a sheet that you
    ///     create that the system displays to the user. If `item` changes,
    ///     the system dismisses the sheet and replaces it with a new one
    ///     using the same process.
    ///   - onDismiss: The closure to execute when dismissing the `destination`.
    ///   - destination: A closure that returns the content of the `destination`.
    func navigation<Destination: View, Item: Equatable & Identifiable>(_ type: NavigationType,
                                                                       item: Binding<Item?>,
                                                                       onDismiss: (() -> Void)? = nil,
                                                                       destination: @escaping (Item?) -> Destination) -> some View {
        switch type {
        case .link:
            self.modifier(NStackDestinationItemModifier(item: item, onDismiss: onDismiss, destination: destination))
        case .sheet:
            self.sheet(item: item, onDismiss: onDismiss) { item in
                destination(item)
            }
            #if !os(macOS)
        case .fullScreenCover:
            self.fullScreenCover(item: item, onDismiss: onDismiss) { item in
                destination(item)
            }
            #endif
        }
    }
    
}

