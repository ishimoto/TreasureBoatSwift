//
//  TBDumpingEnvironment.swift
//  TB To Go iOS
//
//  Created by Ken Ishimoto on 2022/05/28.
//

import SwiftUI

/*
 * Add to a View location foloowing line to dump out all the keys of an environment
 * Example :
 * TBDumpingEnvironment(content: Text("test info"))
 *
 * see : https://betterprogramming.pub/how-to-dump-swiftui-environment-efficiently-1bdf12ef37ed
 */
struct TBDumpingEnvironment<Content>: View where Content: View {
    
    @Environment(\.self) var environmentValues
    
    var optimizePrint = true
    let content: Content

    init(optimized: Bool = true, content: Content) {
        self.optimizePrint = optimized
        self.content = content
    }

    var body: some View {
        if optimizePrint {
            printing(environmentValues)
        } else {
            dump(environmentValues)
        }
        return content
    }

    func printing(_ environmentValues: EnvironmentValues) {
        print("--- Environment Values - BEGIN ---")
        let keyValuePair = environmentValues.asTextualRepresentationWithNonReaptingKeys
        keyValuePair.forEach { print($0) }
        print("--- Environment Values - END ---")
    }
}
