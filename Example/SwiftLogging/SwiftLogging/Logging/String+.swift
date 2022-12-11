//
//  String+.swift
//  SwiftLogging
//
//  Created by Ken Ishimoto on 2022/12/05.
//

import Foundation


extension String {
    var lastPathComponent: String {
        return String(self.split(separator: "/").last ?? "")
    }
}
