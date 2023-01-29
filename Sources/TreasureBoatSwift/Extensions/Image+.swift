//
//  Image+.swift
//  
//
//  Created by Ken Ishimoto on 2023/01/28.
//

import SwiftUI

public extension Image {
    
    static func loremIpsumURL(width: Int, height: Int) -> String {
        return "https://picsum.photos/\(width)/\(height)";
    }

}
