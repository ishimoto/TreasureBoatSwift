//
//  ITBHTTPRequester.swift
//  Requester
//
//  Created by Alex Nagy on 27.07.2022.
//

import Foundation

protocol ITBHTTPRequester {
    func send<T: TBHTTPRequest, R: Decodable>(_ request: T, expect type: R.Type) async throws -> TBRequestFetch<R>
    func send<T: TBHTTPRequest>(_ request: T, pretty: Bool) async throws -> TBRequestJson
    func send<T: TBHTTPRequest>(_ request: T) async throws -> TBRequestData
}
