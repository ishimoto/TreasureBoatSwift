//
//  TBProfile.swift
//  
//
//  Created by Ken Ishimoto on 2022/12/12.
//

import Foundation

public struct TBProfile : Codable, Identifiable {
    
    /// TreasureBoat ID
    public let id: String

    /* SERVER CONECT */
    
    /// Person ID
    public let pid: String
    
    /// Name of the Server
    public let serverName: String
    
    /// The URL of the Server
    public let serverURL: String

    /// The current Domain
    public let serverDomain: String
    
    /// AccessPermission
    public let accessPermission: String

    // MARK: - FIXME add for FireBase, FireBase ID to connect

    public init() {
        self.id = TBConstant.SharedID.SharedTreasureBoatID
        self.pid = ""
        self.serverName = ""
        self.serverURL = ""
        self.serverDomain = ""
        self.accessPermission = ""
    }
    
    public init(id: String, pid: String, serverName: String, serverURL: String, serverDomain: String, accessPermission: String) {
        self.id = id
        self.pid = pid
        self.serverName = serverName
        self.serverURL = serverURL
        self.serverDomain = serverDomain
        self.accessPermission = accessPermission
    }
    
    /// Check if the Profile is valid or not
    /// - Returns: true is we have a Servername'
    public func isValidProfile() -> Bool {
        return !serverName.isEmpty
    }
    
    public func getUrl() -> String {
        return serverURL.isEmpty ? "" : serverURL
    }
        
    public func getFullUrl(additionalPath: String) -> String {
        return serverURL.isEmpty ? "" : serverURL + additionalPath
    }

    public func logDebugInfo() {
        Log.info("TBProfile   :")
        Log.info("            : ID '\(id)'")
        Log.info("            : PID '\(pid)'")
        Log.info("            : ServerName '\(serverName)'")
        Log.info("            : ServerURL '\(serverURL)'")
        Log.info("            : ServerDomain '\(serverDomain)'")
        Log.info("            : AccessPermission '\(accessPermission)'")
        Log.info("============")
    }
}
