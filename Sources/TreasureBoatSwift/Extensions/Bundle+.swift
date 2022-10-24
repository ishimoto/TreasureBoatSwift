//
//  Bundle+.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/16.
//

import Foundation

extension Bundle {
    
    public static var appVersionBuild: String {
        let bundleKey = kCFBundleVersionKey as String
        if let version = Bundle.main.object(forInfoDictionaryKey: bundleKey) as? String {
            return version
        }
        return "0"
    }
    
    public static func getOSInfo() -> String {
        let os = ProcessInfo.processInfo.operatingSystemVersion
        return String(os.majorVersion) + "." + String(os.minorVersion) + "." + String(os.patchVersion)
    }
    
}
