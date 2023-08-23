//
//  NStackDestinationItemModifier.swift
//  NStackBuilder
//
//  Created by Alex Nagy on 06.07.2023.
//


import SwiftUI

public struct NStackDestinationItemModifier<Destination: View, Item: Identifiable & Equatable>: ViewModifier {
    
    @Binding var item: Item?
    var onDismiss: (() -> Void)?
    @ViewBuilder var destination: (Item?) -> Destination
    
    @State private var isPresented: Bool = false
    
    func body(content: Content) -> some View {
        Group {
            groupContent(content)
        }
        .onChange(of: isPresented) { newValue in
            if !newValue {
                item = nil
                onDismiss?()
            }
        }
    }
    
    @ViewBuilder
    func groupContent(_ content: Content) -> some View {
        content
            .onChange(of: item) { newValue in
                isPresented = newValue != nil
            }
            .navigationDestination(isPresented: $isPresented) {
                destination(item)
            }
    }
}
