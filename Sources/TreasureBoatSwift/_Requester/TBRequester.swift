//
//  TBRequester.swift
//  Requester
//
//  Created by Alex Nagy on 27.07.2022.
//

import Foundation

open class TBRequester: ITBHTTPRequester {
    
    private let session: URLSession
    private var decoder: ITBGenericDecoder?
    
    public init(
        session: URLSession = URLSession.shared,
        decoder: ITBGenericDecoder? = JSONDecoder()
    ) {
        self.session = session
        self.decoder = decoder
    }
    
    /// Sends an `HTTPRequest` that expects the data returned as a `Decodable` set in the `type`
    /// - Parameters:
    ///   - request: an `HTTPRequest`
    ///   - type: a `Decodable` for the result that is expected in
    /// - Returns: a `RequestFetch` containing a `Decodable` set in the `type` and a `HTTPURLResponse`
    open func send<T: TBHTTPRequest, R: Decodable>(_ request: T, expect type: R.Type) async throws -> TBRequestFetch<R> {
        let (data, response) = try await data(for: request)
        guard let decoder = decoder else {
            throw ETBRequestError.decoderFailure
        }
        let result = try decoder.decode(expect: R.self, from: data)
        let requestFetch = TBRequestFetch(result: result, response: response)
        return requestFetch
    }
    
    /// Sends an `HTTPRequest` that expects the data returned as a `JSON String`
    /// - Parameters:
    ///   - request: an `HTTPRequest`
    ///   - pretty: is the returned `JSON String` in `pretty` format; default is `false`
    /// - Returns: a `RequestJson` containing a `JSON String` and a `HTTPURLResponse`
    open func send<T: TBHTTPRequest>(_ request: T, pretty: Bool = false) async throws -> TBRequestJson {
        let (data, response) = try await data(for: request)
        let json = data.jsonString(pretty: pretty)
        let requestJson = TBRequestJson(json: json, response: response)
        return requestJson
    }
    
    /// Sends an `HTTPRequest` that expects the data returned as `Data`
    /// - Parameters:
    ///   - request: an `HTTPRequest`
    /// - Returns: a `RequestData` containing a `Data` and a `HTTPURLResponse`
    open func send<T: TBHTTPRequest>(_ request: T) async throws -> TBRequestData {
        let (data, response) = try await data(for: request)
        let requestData = TBRequestData(data: data, response: response)
        return requestData
    }
    
    private func data<T: TBHTTPRequest>(for request: T) async throws -> (Data, HTTPURLResponse) {
        guard let urlRequest = request.composeRequest() else {
            throw ETBRequestError.requestCompositionFailure
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else { throw ETBRequestError.unexpectedResponse }
        
        guard (200...299).contains(response.statusCode) else {
            throw NSError(domain: "\(TBNetworkingError.init(errorCode: response.statusCode))", code: response.statusCode)
        }
        
        return (data, response)
    }
    
}

