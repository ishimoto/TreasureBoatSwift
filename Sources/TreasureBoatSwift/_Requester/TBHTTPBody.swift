//
//  TBHTTPBody.swift
//  Requester
//
//  Created by Alex Nagy on 27.07.2022.
//

import Foundation

public struct TBHTTPBody {
    private(set) var data: Data?
    
    public init(data: Data?) {
        self.data = data
    }
    
    public init<T: Encodable>(_ object: T, encoder: ITBGenericEncoder = JSONEncoder()) {
        data = try? encoder.encode(object)
    }
}
