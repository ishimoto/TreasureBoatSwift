//
//  TBMultiItemPickerOptions.swift
//  
//
//  Created by Alex Nagy on 14.10.2022.
//

import SwiftUI

public struct TBMultiItemPickerOptions {
    public var showsAllToggle: Bool
    public var iconAlignment: ETBMultiItemPickerIconAlignment
    public var style: ETBMultiItemPickerStyle?
    public var rowSeparatorVisibility: Visibility?
    public var rowSeparatorTint: TBMultiItemPickerRowSeparatorTint?
    public var rowInsets: EdgeInsets?
    
    public init(showsAllToggle: Bool = true,
                iconAlignment: ETBMultiItemPickerIconAlignment = .trailing,
                style: ETBMultiItemPickerStyle? = nil,
                rowSeparator visibility: Visibility? = nil,
                rowSeparatorTint: TBMultiItemPickerRowSeparatorTint? = nil,
                rowInsets: EdgeInsets? = nil) {
        self.showsAllToggle = showsAllToggle
        self.iconAlignment = iconAlignment
        self.style = style
        self.rowSeparatorVisibility = visibility
        self.rowSeparatorTint = rowSeparatorTint
        self.rowInsets = rowInsets
    }
}
