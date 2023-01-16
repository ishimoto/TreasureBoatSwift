//
//  ImageUIKit+.swift
//  
//
//  Created by Ken Ishimoto on 2022/08/21.
//

import SwiftUI

#if os(tvOS) || os(iOS) || os(watchOS)

import UIKit

extension Image {
    
    // MARK: - TB Images
    
    public static let tbShip: Image = Image(assetName: TBConstant.Image.tbShip)
    public static let tbLogo: Image = Image(assetName: TBConstant.Image.tbLogo)
    
    // MARK: - Asset support in SPM
    
    /// Get the  Image form the Images Folder (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the image from this Bundle
    /// - Returns: The Image.
    public init(packageResource name: String, ofType type: String) {
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            self.init(name)
            return
        }
        self.init(uiImage: image)
    }
    
    /// Get the  Image form the Media Asset Catalog (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the asset from this Bundle
    /// - Returns: The Image.
    public init(assetName: String) {
        let uiImage = UIImage(named: assetName, in: .module, with: nil)
        if uiImage == nil {
            self.init(systemSymbol: .questionmark)
            return
        }
        self.init(uiImage: uiImage!)
    }
    
}

#endif
