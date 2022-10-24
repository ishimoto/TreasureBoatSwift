//
//  TBObservableObject.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/18.
//

import Foundation

open class TBObservableObject: ObservableObject {
    
    public init() {
        // ...
    }
    
    @Published public var loadingState: TBLoadingState = .none
    @Published public var failureMessage: String = ""

    public func clearMessage() {
        self.failureMessage = ""
        self.loadingState = .loading
    }

}
