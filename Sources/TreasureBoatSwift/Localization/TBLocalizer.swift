//
//  TBLocalizer.swift
//  
//
//  Created by Ken Ishimoto on 2022/06/24.
//

import Foundation

public struct TBLocalizer {

    // MARK: - Init
    
    public static let sharedInstance = TBLocalizer()

    private init() {
        // ...
    }

    // MARK: - Properties
    
    public let ENGLISH: String = "en"
    public let JAPANESE: String = "ja"

    // MARK: - Code
    
    /// returns the App Main language like 'en'
    /// - Returns: the App Main as an 2 char long language identifier
    /// - SeeAlso: ``deviceLanguage()``
    public func applicationLanguage() -> String {
        let appLocalizations: [String] = Bundle.main.preferredLocalizations
        
        guard let appLocalization = appLocalizations.first else {
            // return english as default
            return ENGLISH
        }
        return appLocalization
    }
    
    /// returns the Device Main language like 'en'
    /// - Returns: the Device Main as an 2 char long language identifier
    /// - SeeAlso: ``applicationLanguage()``
    public func deviceLanguage() -> String {
        let deviceLocalizations: [String] = Locale.preferredLanguages
        guard let deviceLocalization = deviceLocalizations.first else {
            // return english as default
            return ENGLISH
        }
        return deviceLocalization
    }
    
    /// check if the locale is english.
    ///
    /// - Parameters:
    ///   - locale: A Locale
    /// - Returns: if the parameter locale is english return true.
    public func isEnglish(locale: Locale) -> Bool {
        let prefix: String = locale.identifier
        return prefix.hasPrefix(ENGLISH)
    }
    
    /// check if the locale is japanese.
    ///
    /// - Parameters:
    ///   - locale: A Locale
    /// - Returns: if the parameter locale is japanese return true.
    public func isJapanese(locale: Locale) -> Bool {
        let prefix: String = locale.identifier
        return prefix.hasPrefix(JAPANESE)
    }
    
}
