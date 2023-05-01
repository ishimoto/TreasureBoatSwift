//
//  TBObservableObject.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/18.
//

import SwiftUI

@MainActor
open class TBObservableObject: ObservableObject {
    
    public init() {
        // ...
    }
    
    @Published public var loadingState: TBLoadingState = .none

    @Published public var showFailureMessage: Bool = false
    @Published public var failureMessage: String = ""

    @Published public var showSuccessMessage: Bool = false
    @Published public var successMessage: String = ""

    private func clearFailure() {
        showFailureMessage = false
        failureMessage = ""
    }

    private func clearSuccess() {
        showSuccessMessage = false
        successMessage = ""
    }

    public func clearMessage() {
        clearFailure()
        clearSuccess()
        loadingState = .loading
    }

    @MainActor
    public func showFailureMessage(_ message: String) {
        let _message = String(describing: self) + " : \(message)"
        Log.error(_message)
        
        Task { @MainActor in
            self.failureMessage = message
            self.showFailureMessage = true
            self.loadingState = .failed
        }
    }
    
    @MainActor
    public func showSuccessMessage(_ message: String) {
        Task { @MainActor in
            self.successMessage = message
            self.showSuccessMessage = true
            self.loadingState = .success
        }
    }

}
