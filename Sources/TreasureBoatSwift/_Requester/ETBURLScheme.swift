//
//  ETBURLScheme.swift
//  Requester
//
//  Created by Alex Nagy on 27.07.2022.
//

public enum ETBURLScheme: CustomStringConvertible, CaseIterable, Codable {
    
    case http
    case https
    
    public var description: String {
        switch self {
        case .http:
            return "http"
        case .https:
            return "https"
        }
    }
}
