//
//  TBErrorAlertManager.swift
//
//
//  Created by Alex Nagy on 22.10.2022.
//

import SwiftUI

public class TBErrorAlertManager: ObservableObject {
    
    @Published public var isPresented = false
    @Published public var error: LocalizedError?
    @Published public var recoverySuggestion: TBErrorAlertButton = .init(title: "", action: {})
    @Published public var helpAnchor: TBErrorAlertButton = .init(title: "", action: {})
    @Published public var cancelButtonTitle: String?
    
    public init() {}
    
    public func present(_ error: LocalizedError?, recoverySuggestion: TBErrorAlertButton, helpAnchor: TBErrorAlertButton, cancelButtonTitle: String? = nil) {
        self.error = error
        self.recoverySuggestion = recoverySuggestion
        self.helpAnchor = helpAnchor
        self.cancelButtonTitle = cancelButtonTitle
        isPresented.toggle()
    }
}

public struct TBErrorAlertModifier: ViewModifier {
    
    @EnvironmentObject private var viewModel: TBErrorAlertManager
    
    public func body(content: Content) -> some View {
        content
            .alert(viewModel.error?.errorDescription ?? "", isPresented: $viewModel.isPresented, actions: {
                if let cancelButtonTitle = viewModel.cancelButtonTitle {
                    Button(role: .cancel, action: {}) {
                        Text(cancelButtonTitle)
                    }
                }
                Button(role: viewModel.recoverySuggestion.role ?? .none, action: viewModel.recoverySuggestion.action) {
                    Text(viewModel.recoverySuggestion.title)
                }
                Button(role: viewModel.helpAnchor.role ?? .none, action: viewModel.helpAnchor.action) {
                    Text(viewModel.helpAnchor.title)
                }
            }, message: {
                let failureReason = viewModel.error?.failureReason
                let recoverySuggestion = viewModel.error?.recoverySuggestion
                let helpAnchor = viewModel.error?.helpAnchor
                Text("\n\(failureReason ?? "")\n\n\(recoverySuggestion ?? "")\n\n\(helpAnchor ?? "")")
            })
    }
}

public extension View {
    func usesErrorAlertManager(_ errorAlertManager: TBErrorAlertManager) -> some View {
        self.modifier(TBErrorAlertModifier())
            .environmentObject(errorAlertManager)
    }
}

public struct TBErrorAlertButton {
    public let title: String
    public let role: ButtonRole?
    public let action: () -> Void
    
    public init(title: String, role: ButtonRole? = nil, action: @escaping () -> Void) {
        self.title = title
        self.role = role
        self.action = action
    }
}
