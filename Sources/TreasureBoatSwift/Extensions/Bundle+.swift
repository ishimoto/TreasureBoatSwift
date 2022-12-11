//
//  Bundle+.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/16.
//

import SwiftUI

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
    
    
//    public var appName: String {
//        if let name = self.infoDictionary?["CFBundleName"] as? String {
//            return name
//        }
//        Log.info("Unable to determine 'appName'")
//        return "Unknown"
//    }

    public static var appName: String {
        if let name = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            return name
        }
        Log.info("Unable to determine 'appName'")
        return "Unknown"
    }
    
    public static var appVersionMarketing: String {
        if let name = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return name
        }
        Log.info("Unable to determine 'appVersionMarketing'")
        return "Unknown"
    }

    public static var copyrightHumanReadable: String {
        if let name = Bundle.main.infoDictionary?["NSHumanReadableCopyright"] as? String {
            return name
        }
        Log.info("Unable to determine 'copyrightHumanReadable'")
        return "Unknown"
    }

    public static var versionNumber: String {
        let version = appVersionMarketing
        let build = appVersionBuild
        return "v. \(version) (\(build))"
    }
    
    /* Return the application Icon as an Image */
    
    public static var applicationIcon: Image? {
#if canImport(UIKit)
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String:Any],
              let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String:Any],
              let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
              let lastIcon = iconFiles.last else { return nil }
        
        guard let uiIcon = UIImage(named: lastIcon) else { return nil }
        return Image(uiImage: uiIcon)
        
#elseif canImport(AppKit)
        return Image(nsImage: NSApp.applicationIconImage)
#endif
    }
    
    /* Decode a JSON File from the Bundle */
    
    public func decode<T: Codable>(_ file: String) -> T {
        
        // 1. Locate the json file
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return the ready-to-use data
        return loaded
    }

}
