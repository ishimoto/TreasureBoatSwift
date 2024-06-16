//
//  TBSlideInViewManager.swift
//
//
//  Created by Alex Nagy on 24.01.2023.
//

#if !os(tvOS)
import SwiftUI

@propertyWrapper
public struct TBSlideInViewManager: DynamicProperty {
    
    @EnvironmentObject public var context: TBSlideInViewManagerContext
    
    public var wrappedValue: Bool {
        get {
            context.isActive
        }
        nonmutating set {
            context.isActive = newValue
        }
    }
    
    public init() { }
}

@MainActor
final public class TBSlideInViewManagerContext: ObservableObject {
    
    @Published public var isActive: Bool = false
    
    public init() { }
    
}
#endif
