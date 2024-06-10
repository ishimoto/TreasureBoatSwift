//
//  ITBResponse.swift
//  Requester
//
//  Created by Alex Nagy on 27.07.2022.
//

import Foundation

public protocol ITBResponse {
    associatedtype T
    
    var httpResponse: HTTPURLResponse { get }
    var result: T { get }
}
