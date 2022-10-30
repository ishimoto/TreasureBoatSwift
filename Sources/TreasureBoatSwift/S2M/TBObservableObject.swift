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

    private func clearFailure() {
        showFailureMessage = false
        failureMessage = ""
    }
    
    public func clearMessage() {
        clearFailure()
        loadingState = .loading
    }

    @MainActor
    public func showFailureMessage(_ message: String) {
        let _message = String(describing: self) + " : \(message)"
        
        print(_message)
        #warning("Fix LOG")
        //log.info(_message) // TODO
        
        Task { @MainActor in
            self.failureMessage = message
            self.showFailureMessage = true
            self.loadingState = .failed
        }
    }

}
