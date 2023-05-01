//
//  Request+.swift
//  
//
//  Created by Ken Ishimoto on 2023/04/22.
//

import Foundation
import MagicUI

extension Request {
    
    public convenience init(url: String,
                            method: HTTPMethod,
                            headers: [String: String]? = nil,
                            body: HTTPBody? = nil) {

        // split the URL
        let urlComponents = URLComponents(string: url)

        // Host is mandatory
        guard let _host = urlComponents?.host else {
            fatalError("Host is missing")
        }
        
        // Missing Schema will be automatically https
        var _scheme: Scheme
        
        let _schemaAsString = urlComponents?.scheme ?? ""
        switch _schemaAsString {
        case "https":
            _scheme = .https
        case "http":
            _scheme = .http
        default:
            _scheme = .https
        }

        // Re-Format the [URLQueryItem] -> [String : String]
        var queryDictionary = [String: String]()
        let urlQueryItem: [URLQueryItem] = urlComponents?.queryItems ?? []
        urlQueryItem.forEach { oneItem in
            queryDictionary[oneItem.name] = oneItem.value
        }
        
        self.init(scheme: _scheme,
                  host: _host,
                  path: urlComponents?.path ?? "", // in the case of access to the host a path could be empty
                  port: urlComponents?.port,
                  method: method,
                  headers: headers,
                  queryParameters: queryDictionary,
                  body: body)
    }
    
}
