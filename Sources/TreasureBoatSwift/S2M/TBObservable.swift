//
//  TBObservable.swift (iOS17+)
//
//
//  Created by Ken Ishimoto on 2023/11/19.
//

import SwiftUI

@available(macOS 14.0, *)
@available(iOS 17.0, watchOS 10.0, *)

@Observable
open class TBObservable {
    
    public var loadingState: TBLoadingState = .none
    
    public var showFailureMessage: Bool = false
    public var failureMessage: String = ""
    
    public var showSuccessMessage: Bool = false
    public var successMessage: String = ""
    
    public init() {
        // ...
    }
    
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
    
    public func showFailureMessage(_ message: String) {
        let _message = String(describing: self) + " : \(message)"
        Log.error(_message)
        
        failureMessage = message
        showFailureMessage = true
        loadingState = .failed
    }
    
    public func showSuccessMessage(_ message: String) {
        successMessage = message
        showSuccessMessage = true
        loadingState = .success
    }
    
}
