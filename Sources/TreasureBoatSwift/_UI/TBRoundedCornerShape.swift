//
//  TBRoundedCornerShape.swift
//
//
//  Created by Ken Ishimoto on 2024/06/23.
//

import SwiftUI

public struct TBRoundedCornerShape: Shape {
    
    public var radius: CGFloat = .zero
    public var corners: TBRectCorner = .all
    public var style: RoundedCornerStyle = .continuous
    
    public init(radius: CGFloat, corners: TBRectCorner, style: RoundedCornerStyle) {
        self.radius = radius
        self.corners = corners
        self.style = style
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topLeading: CGFloat = corners.contains(.topLeading) ? radius : 0
        let bottomLeading: CGFloat = corners.contains(.bottomLeading) ? radius : 0
        let bottomTrailing: CGFloat = corners.contains(.bottomTrailing) ? radius : 0
        let topTrailing: CGFloat = corners.contains(.topTrailing) ? radius : 0
        
        let cornerRadii = RectangleCornerRadii(
            topLeading: topLeading,
            bottomLeading: bottomLeading,
            bottomTrailing: bottomTrailing,
            topTrailing: topTrailing
        )
        
        path.addRoundedRect(
            in: rect,
            cornerRadii: cornerRadii,
            style: style
        )
        
        return path
    }
}

extension View {
    public func cornerRadius(_ radius: CGFloat, corners: TBRectCorner = .all, style: RoundedCornerStyle = .continuous) -> some View {
        clipShape(
            TBRoundedCornerShape(
                radius: radius,
                corners: corners,
                style: style
            )
        )
    }
}

