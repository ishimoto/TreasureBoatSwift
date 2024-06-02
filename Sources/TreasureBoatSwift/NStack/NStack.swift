////
////  NStack.swift
////  NStackBuilder
////
////  Created by Alex Nagy on 06.07.2023.
////
//
//import SwiftUI
//
///**
// https://store.rebeloper.com/view/courses/nstack/2120952-video-documentation/6684169-swiftui-navigation-perfected-harnessing-nstack-s-game-changing-capabilities
// */
//public struct NStack<Root: View>: View {
//    
//    @ViewBuilder public var root: () -> Root
//    
//    public var body: some View {
//        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
//            NavigationStack {
//                root()
//            }
//        } else {
//            NavigationView {
//                root()
//            }
//#if !os(macOS)
//            .navigationViewStyle(.stack)
//#endif
//        }
//    }
//}
//
