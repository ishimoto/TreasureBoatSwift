//
//  TBSlideInViewOptions.swift
//
//
//  Created by Alex Nagy on 24.01.2023.
//

#if !os(tvOS)
import SwiftUI

public struct TBSlideInViewOptions {
    public var presentationMode: ETBSlideInViewPresentationMode
    public var paddingColor: Color
    public var paddingColorOpacity: CGFloat
    public var shouldDismissUponSwipe: Bool
    public var shouldDismissUponExternalTap: Bool
    
    public init(presentationMode: ETBSlideInViewPresentationMode = .push,
                paddingColor: Color = .black,
                paddingColorOpacity: CGFloat = 0.1,
                shouldDismissUponSwipe: Bool = true,
                shouldDismissUponExternalTap: Bool = true) {
        self.presentationMode = presentationMode
        self.paddingColor = paddingColor
        self.paddingColorOpacity = paddingColorOpacity
        self.shouldDismissUponSwipe = shouldDismissUponSwipe
        self.shouldDismissUponExternalTap = shouldDismissUponExternalTap
    }
}
#endif
