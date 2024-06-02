//
//  TBLoginError.swift
//
//
//  Created by Ken Ishimoto on 2024/06/02.
//

import Foundation

/// https://augmentedcode.io/2020/03/01/alert-and-localizederror-in-swiftui/
public enum TBLoginError: LocalizedError {
    case incorrectPassword // invalidUserName etc
     
    public var errorDescription: String? {
        switch self {
        case .incorrectPassword:
            return "Failed logging in account"
        }
    }
     
    public var failureReason: String? {
        switch self {
        case .incorrectPassword:
            return "Entered password was incorrect"
        }
    }
     
    public var recoverySuggestion: String? {
        switch self {
        case .incorrectPassword:
            return "Please try again with different password"
        }
    }
}
