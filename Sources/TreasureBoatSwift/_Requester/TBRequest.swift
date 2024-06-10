//
//  TBRequest.swift
//  Requester
//
//  Created by Alex Nagy on 27.07.2022.
//

import Foundation

/// This is a basic implementation of the `TBHTTPRequest` protocol.
/// If you have common properties that are the same across multiple requests
/// then subclassing `TBRequest` and filling in those common values is one option
/// so `TBRequest` is a class not a struct for that reason but using `struct`s is also encouraged
/// with `TBHTTPRequest`
open class TBRequest: TBHTTPRequest {
    
    public var scheme: ETBURLScheme
    
    public var host: String
    
    public var path: String
    
    public var port: Int?
    
    public var headers: [String : String]?
    
    public var queryParameters: [String : String]?
    
    public var method: ETBHTTPMethod
    
    public var body: TBHTTPBody?
    
    public init(
        scheme: ETBURLScheme,
        host: String,
        path: String,
        port: Int? = nil,
        method: ETBHTTPMethod,
        headers: [String: String]? = nil,
        queryParameters: [String: String]? = nil,
        body: TBHTTPBody? = nil) {
            self.scheme = scheme
            self.host = host
            self.path = path
            self.port = port
            self.method = method
            self.body = body
            self.headers = headers
            self.queryParameters = queryParameters
        }
    
    
    public convenience init(url: String,
                            method: ETBHTTPMethod,
                            headers: [String: String]? = nil,
                            body: TBHTTPBody? = nil) {

        // split the URL
        let urlComponents = URLComponents(string: url)

        // Host is mandatory
        guard let _host = urlComponents?.host else {
            fatalError("Host is missing")
        }
        
        // Missing Schema will be automatically https
        var _scheme: ETBURLScheme
        
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
