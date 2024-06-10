//
//  TBService.swift
//
//
//  Created by Ken Ishimoto on 2024/06/10.
//

import SwiftUI

public struct TBService {
    
    /// Do something (mostly used for fake a task for a test)
    public static func doSomeWork(progressValue: Binding<Float>, completion: @escaping () -> ()) {
        progressValue.wrappedValue = 0.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, 
                                      execute: {
            progressValue.wrappedValue = 0.15
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0,
                                      execute: {
            progressValue.wrappedValue = 0.25
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5,
                                      execute: {
            progressValue.wrappedValue = 0.5
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0,
                                      execute: {
            progressValue.wrappedValue = 0.75
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5,
                                      execute: {
            withAnimation {
                progressValue.wrappedValue = 1.0
            }
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0,
                                      execute: {
            completion()
        })
    }
}
