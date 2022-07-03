//
//  URL+.swift
//  
//
//  Created by Ken Ishimoto on 2022/07/02.
//

import Foundation

extension URL {

    /// Returns a URL for the given app group and database pointing to the sqlite database.
    /// - parameter appGroup: the app Goupe name
    /// - parameter databaseName: the name of the database
    /// - Returns: The URL to the sqlite database.
    public static func storeURL(for appGroup: String, databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            fatalError("Shared file container could not be created.")
        }
        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }

    /// Returns a URL for the  database pointing to the sqlite database.
    /// - parameter databaseName: the name of the database
    /// - Returns: The URL to the sqlite database.
    public static func storeURL(databaseName: String) -> URL {
        guard let fileContainer = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
            fatalError("Application Support file container could not be found.")
        }
        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }

}
