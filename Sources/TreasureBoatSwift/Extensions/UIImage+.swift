//
//  UIImage.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/12.
//

import SwiftUI

#if (iOS || watchOS || tvOS)
import UIKit

extension UIImage {
    
    // MARK: - TB Images
    
    public static let tbShip: UIImage = UIImage.fromAsset(assetName: TBConstant.Image.tbShip)
    public static let tbLogo: UIImage = UIImage.fromAsset(assetName: TBConstant.Image.tbLogo)
    
    // MARK: - UIImage Helper
    
    /// 指定したファイルパスに画像を簡単に保存してやるメソッドを用意してやります。
    ///
    /// - parameter asPngTo: the file saved location as PNGデータ
    func write(asPngTo path: String) {
        guard let data = pngData() else {
            return
        }
        try? data.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
    
    /// 指定したファイルパスに画像を簡単に保存してやるメソッドを用意してやります。
    ///
    /// - parameter asJpegTo: the file saved location as JPGデータ
    /// - parameter compressionQuality: the quality of the compression, default is 0.9
    func write(asJpegTo path: String, compressionQuality quality: CGFloat = 0.9) {
        guard let data = jpegData(compressionQuality: quality) else {
            return
        }
        try? data.write(to: URL(fileURLWithPath: path), options: [.atomic])
    }
    
    // MARK: - Asset support in SPM
    
    /// Get the  UIImage form the Images Folder (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the image from this Bundle
    /// - Returns: The Image.
    static func fromResource(packageResource name: String, ofType type: String) -> UIImage {
        guard let path = Bundle.module.path(forResource: name, ofType: type),
              let image = UIImage(contentsOfFile: path) else {
            return UIImage()
        }
        return image
    }
    
    /// Get the  UIImage form the Media Asset Catalog (TreasureBoatSwift Bundle).
    /// - parameter assetName: the name of the asset from this Bundle
    /// - Returns: The UIImage.
    public static func fromAsset(assetName: String) -> UIImage {
        guard let uiImage = UIImage(named: assetName, in: .module, with: nil) else {
            return UIImage()
        }
        return uiImage
    }
    
}
#endif
