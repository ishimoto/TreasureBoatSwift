//
//  TBRequestFetch.swift
//
//  Created by Alex Nagy on 27.07.2022.
//

import Foundation

public struct TBRequestFetch<R: Decodable> {
    public let result: R
    public let response: HTTPURLResponse
}
