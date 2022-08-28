//
//  TBShapeRoundedCorners.swift
//  
//
//  Created by Ken Ishimoto on 2022/07/02.
//

import SwiftUI

#if os(iOS)

@available(iOS 15.0, *)
public struct TBShapeRoundedCorners: Shape {
    
    var corners: UIRectCorner
    var radius: CGFloat
    
    // in Package we have to provide an init and also make all public
    public init(corners: UIRectCorner, radius: CGFloat) {
        self.corners = corners
        self.radius = radius
    }
    
    public func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
    
}

@available(iOS 15.0, *)
struct TBShapeRoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        
        TBShapeRoundedCorners(corners: [.topLeft, .topRight], radius: 35)
            .previewLayout(.fixed(width: 428, height: 120))
            .padding()
        
    }
}
#endif
