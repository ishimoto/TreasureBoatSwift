//
//  TBURI.swift
//  
//
//  Created by Ken Ishimoto on 2023/01/28.
//

import Foundation
import UniformTypeIdentifiers

@available(iOS 14.0, *)
@available(OSX 11.0, *)
@available(tvOS 13.0, *)

public struct TBURI {
    
    private static func fileExtension(_ file: String) -> String? {
        let pathExtension: String? = NSURL(fileURLWithPath: file).pathExtension
        guard let fileExtension = pathExtension else {
            return nil
        }
        return fileExtension
    }
    
    public static func isImage(_ file: String) -> Bool {
        let pathExtension: String? = fileExtension(file)
        guard let fileExtension = pathExtension else {
            return false
        }
        
        let x = UTType(tag: fileExtension, tagClass: .filenameExtension, conformingTo: nil)
        let b = x?.isSubtype(of: .image)
        return b ?? false
    }

}
