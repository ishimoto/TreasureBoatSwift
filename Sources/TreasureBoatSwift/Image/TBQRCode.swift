//
//  TBQRCode.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/23.
//

#if os(iOS) || os(macOS)

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

public struct TBQRCode {
    
    public static func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemSymbol: .xmarkCircle)
    }
        
}

#endif
