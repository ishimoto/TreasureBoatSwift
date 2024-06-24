//
//  ITBIntroProtocol.swift
//
//
//  Created by Ken Ishimoto on 2024/06/23.
//

import SwiftUI

public protocol ITBIntroProtocol {
    
    var title: String { get }
    
    var color: Color { get }
    
    var version: Int { get }
    
    var pointViews: [TBIntroModel] { get }
    
}
