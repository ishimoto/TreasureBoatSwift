//
//  macOS_TBQRCode.swift
//
//
//  Created by Ken Ishimoto on 2023/11/18.
//

#if os(macOS)

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

public struct TBQRCode {
    
    public static func generateQRCode(from string: String, size: NSSize) -> NSImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return NSImage(cgImage: cgImage, size: size)
            }
        }
        return NSImage(systemSymbol: .xmarkCircle)
    }
        
}

#endif
