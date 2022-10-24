//
//  Data.swift
//  
//
//  Created by Ken Ishimoto on 2022/10/12.
//

import UIKit

public extension Data {

    /// データ→イメージに変換する
    ///
    /// - Returns: 変換後のイメージ
    func toImage() -> UIImage {
        guard let image = UIImage(data: self) else {
            print("データをイメージに変換できませんでした。")
            return UIImage()
        }
        return image
    }

}
