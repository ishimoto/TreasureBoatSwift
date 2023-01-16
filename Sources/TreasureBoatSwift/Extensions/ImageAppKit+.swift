//
//  ImageAppKit+.swift
//  
//
//  Created by Ken Ishimoto on 2023/01/15.
//

import SwiftUI

#if (macOS)

import AppKit

public extension Image {
    
    // MARK: - TB Images
    
    public static let tbShip: Image = Image(assetName: TBConstant.Image.tbShip)
    public static let tbLogo: Image = Image(assetName: TBConstant.Image.tbLogo)
    
    // MARK: - Asset support in SPM
    
    /// Get the  Image form the Images Folder (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the image from this Bundle
    /// - Returns: The Image.
    public init(packageResource name: String, ofType type: String) {
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = NSImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(nsImage: image)
    }
    
    /// Get the  Image form the Media Asset Catalog (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the asset from this Bundle
    /// - Returns: The Image.
    public init(assetName: String) {
        let nsImage = NSImage(named: assetName, in: .module, with: nil)
        if let nsImage {
            self.init(nsImage: nsImage!)
            return
        }
        self.init(systemSymbol: .questionmark)
    }
}

#endif

