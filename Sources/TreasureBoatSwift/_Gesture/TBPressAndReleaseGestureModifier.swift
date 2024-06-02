//
//  TBPressAndReleaseGestureModifier.swift
//  SwiftUIGestures
//
//  Created by Alex Nagy on 02.05.2023.
//

import SwiftUI

public struct TBPressAndReleaseGestureModifier: ViewModifier {
    
    var onPressingStarted: (DragGesture.Value) -> Void
    var onPressingReleased: (DragGesture.Value) -> Void
    
    @State private var didStart = false
    
    public func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ value in
                        guard !didStart else { return }
                        didStart.toggle()
                        onPressingStarted(value)
                    })
                    .onEnded({ value in
                        didStart.toggle()
                        onPressingReleased(value)
                    })
            )
    }
}

public extension View {
    func onPressGesture(_ onPressingStarted: @escaping (DragGesture.Value) -> Void,
                        onPressingReleased: @escaping (DragGesture.Value) -> Void) -> some View {
        modifier(TBPressAndReleaseGestureModifier(onPressingStarted: onPressingStarted, onPressingReleased: onPressingReleased))
    }
}
