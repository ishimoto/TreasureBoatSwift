//
//  TBXCode.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/08/09.
//

import Foundation

public struct TBXCode {
    
    public static var isXCodeCanvas : Bool {
        let canvas: String = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] ?? "0"
        return canvas == "1"
    }

}
