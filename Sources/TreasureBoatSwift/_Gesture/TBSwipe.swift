//
//  TBSwipe.swift
//  SwiftUIGestures
//
//  Created by Alex Nagy on 02.05.2023.
//

import SwiftUI

public struct TBSwipe: OptionSet, Equatable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    fileprivate var swiped: ((DragGesture.Value, Double) -> Bool) = {_, _ in false}
    
    private static let sensitivityFactor: Double = 400
    
    public static var left: TBSwipe {
        var swipe = TBSwipe(rawValue: 0)
        swipe.swiped = { value, sensitivity in
            value.translation.width < 0 && value.predictedEndTranslation.width < sensitivity * sensitivityFactor
        }
        return swipe
    }
    
    public static var right: TBSwipe {
        var swipe = TBSwipe(rawValue: 1)
        swipe.swiped = { value, sensitivity in
            value.translation.width > 0 && value.predictedEndTranslation.width > sensitivity * sensitivityFactor
        }
        return swipe
    }
    
    public static var up: TBSwipe {
        var swipe = TBSwipe(rawValue: 2)
        swipe.swiped = { value, sensitivity in
            value.translation.height < 0 && value.predictedEndTranslation.height < sensitivity * sensitivityFactor
        }
        return swipe
    }
    
    public static var down: TBSwipe {
        var swipe = TBSwipe(rawValue: 3)
        swipe.swiped = { value, sensitivity in
            value.translation.height > 0 && value.predictedEndTranslation.height > sensitivity * sensitivityFactor
        }
        return swipe
    }
    
    public static var all: TBSwipe {
        [.left, .right, .up, .down]
    }

    private static var allCases: [TBSwipe] = [.left, .right, .up, .down]
    
    fileprivate var array: [TBSwipe] {
        TBSwipe.allCases.filter { self.contains($0) }
    }
}

public extension View {
    func onSwipeGesture(_ swipe: TBSwipe,
                        sensitivity: Double = 1,
                        action: @escaping (TBSwipe) -> ()) -> some View {
        gesture(
            DragGesture(minimumDistance: 30, coordinateSpace: .local)
                .onEnded({ value in
                    swipe.array.forEach { swipe in
                        if swipe.swiped(value, sensitivity) {
                            action(swipe)
                        }
                    }
                })
        )
    }
}
