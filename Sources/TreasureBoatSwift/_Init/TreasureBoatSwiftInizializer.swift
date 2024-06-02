//
//  TreasureBoatSwiftInizializer.swift
//
//
//  Created by Ken Ishimoto on 2024/06/01.
//

import SwiftUI

public struct TreasureBoatSwiftInizializer<Content: View>: View {
    
    let content: () -> Content
    
    public init(content: @escaping () -> Content) {
        self.content = content
    }
    
    @StateObject private var alertManager = TBAlertManager()
    @StateObject private var errorAlertManager = TBErrorAlertManager()

    public var body: some View {
        content()
            .alert(alertManager.options.title ?? "Alert", isPresented: $alertManager.isAlertPresented) {
                alertManager.actions()
            } message: {
                alertManager.message()
            }
            .confirmationDialog(alertManager.options.title ?? "",
                                isPresented: $alertManager.isConfirmationDialogPresented,
                                titleVisibility: alertManager.options.title == nil ? .hidden : .visible) {
                alertManager.actions()
            } message: {
                alertManager.message()
            }
            .environmentObject(alertManager)
        
            .usesErrorAlertManager(errorAlertManager)

    }
}
