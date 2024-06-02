//
//  TBOnBoardingModel.swift
//
//
//  Created by Ken Ishimoto on 2023/12/22.
//

import SwiftUI

public struct TBOnBoardingModel: Identifiable {
    
    public var id = UUID()
    
    public var image: String
    public var title: String
    public var detail: String
    public var bgColor: Color

    public init(id: UUID = UUID(), image: String, title: String, detail: String, bgColor: Color) {
        self.id = id
        self.image = image
        self.title = title
        self.detail = detail
        self.bgColor = bgColor
    }
    
}
