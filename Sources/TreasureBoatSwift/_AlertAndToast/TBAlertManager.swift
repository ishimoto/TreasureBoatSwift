//
//  TBAlertManager.swift
//
//
//  Created by Ken Ishimoto on 2024/06/01.
//

import SwiftUI

public class TBAlertManager: ObservableObject {
    
    @Published public var isAlertPresented: Bool = false
    @Published public var isConfirmationDialogPresented: Bool = false
    @Published public var options: TBAlertOptions = TBAlertOptions()
    
    public init() {}
    
    @ViewBuilder
    func actions() -> some View {
        if let actions = options.actions {
            ForEach(actions) { action in
                Button(role: action.role) {
                    action.action?()
                } label: {
                    Text(action.label)
                }
            }
        } else {
            Button(role: .cancel) {
                // ...
            } label: {
                Text("Cancel")
            }
        }
    }
    
    @ViewBuilder
    func message() -> some View {
        if let message = options.message {
            Text(message)
        } else {
            EmptyView()
        }
    }
    
    public func present(options: TBAlertOptions) {
        self.options = options
        withAnimation {
            switch options.type {
            case .alert:
                isAlertPresented = true
            case .confirmationDialog:
                isConfirmationDialogPresented = true
            }
        }
    }
    
    public func present(_ type: ETBAlertType,
                        title: String? = nil,
                        message: String? = nil,
                        actions: [TBAlertAction]? = nil) {
        present(options: .init(type: type, title: title, message: message, actions: actions))
    }
    
    public func present(_ preset: ETBAlertPreset,
                        _ type: ETBAlertType,
                        message: String,
                        actions: [TBAlertAction]? = nil) {
        var title = ""
        switch preset {
        case .error:
            title = "Error"
        case .success:
            title = "Success"
        case .warning:
            title = "Warning"
        case .info:
            title = "Info"
        }
        present(options: .init(type: type, title: title, message: message, actions: [TBAlertAction(role: .cancel, label: .ok)]))
    }
    
    public func present(_ error: Error,
                        actions: [TBAlertAction]? = nil) {
        present(.error, .alert, message: error.localizedDescription, actions: actions)
    }
    
    public func hide() {
        withAnimation {
            isAlertPresented = false
        }
    }
}

public enum ETBAlertPreset {
    case error, success, warning, info
}

public enum ETBAlertType {
    case alert, confirmationDialog
}

public struct TBAlertOptions {
    var type: ETBAlertType = .alert
    var title: String? = nil
    var message: String? = nil
    var actions: [TBAlertAction]? = nil
    
    public init(type: ETBAlertType = .alert,
                title: String? = nil,
                message: String? = nil,
                actions: [TBAlertAction]? = nil) {
        self.type = type
        self.title = title
        self.message = message
        self.actions = actions
    }
}

public struct TBAlertAction: Identifiable {
    public let id = UUID()
    var role: ButtonRole? = nil
    var label: String
    var action: (() -> Void)? = nil
    
    public init(role: ButtonRole? = nil,
                label: String,
                action: (() -> Void)? = nil) {
        self.role = role
        self.label = label
        self.action = action
    }
    
    public init(role: ButtonRole? = nil,
                label: ETBAlertActionLabel,
                action: (() -> Void)? = nil) {
        self.role = role
        self.label = label.rawValue
        self.action = action
    }
}

public enum ETBAlertActionLabel: String {
    case ok = "OK"
    case cancel = "Cancel"
    case agree = "Agree"
    case later = "Later"
    case remindMeLater = "Remind Me Later"
    case skip = "Skip"
    case dontAskAgain = "Don't Ask Again"
    case dismiss = "Dismiss"
    case forward = "Forward"
    case back = "Back"
    case previous = "Previous"
    case next = "Next"
    case yes = "Yes"
    case no = "No"
    case confirm = "Confirm"
    case deny = "Deny"
    case open = "Open"
    case close = "Close"
}
