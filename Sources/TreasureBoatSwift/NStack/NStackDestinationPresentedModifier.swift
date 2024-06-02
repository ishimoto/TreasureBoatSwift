////
////  NStackDestinationPresentedModifier.swift
////  NStackBuilder
////
////  Created by Alex Nagy on 06.07.2023.
////
//
//import SwiftUI
//
//public struct NStackDestinationPresentedModifier<Destination: View>: ViewModifier {
//    
//    @Binding var isPresented: Bool
//    var onDismiss: (() -> Void)?
//    @ViewBuilder var destination: () -> Destination
//    
//    public func body(content: Content) -> some View {
//        Group {
//            groupContent(content)
//        }
//        .onChange(of: isPresented) { newValue in
//            if !newValue {
//                onDismiss?()
//            }
//        }
//    }
//    
//    @ViewBuilder
//    func groupContent(_ content: Content) -> some View {
//        content
//            .navigationDestination(isPresented: $isPresented, destination: destination)
//    }
//}
