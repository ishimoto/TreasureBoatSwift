//
//  EnvironmentValues.swift
//
//
//  Created by Ken Ishimoto on 2022/12/29.
//

import SwiftUI

extension EnvironmentValues {
    
    public var asTextualRepresentationWithNonReaptingKeys: [String] {
        // split description into lines starting with EnvironmentPropertyKey
        let lineIndices = description.indices(of: "EnvironmentPropertyKey")
        var entries: [String] = []
        for (idx, beginIndexValue) in lineIndices.enumerated() {
            let next: Int = idx + 1
            if idx == lineIndices.count - 1 {
                continue
            }
            let nextIndexValue = lineIndices[next]
            let beginIndex = description.index(description.startIndex, offsetBy: beginIndexValue)
            let endIndex = description.index(description.startIndex, offsetBy: nextIndexValue)
            guard let line = String(description[beginIndex ... endIndex]).components(separatedBy: ", E").first else { continue }
            entries.append(line)
        }
        
        // filter out lines with repeating EnvironmentPropertyKey's because only the top level value is relevant
        var processedKeys: [String] = []
        entries = entries.filter { line in
            var isIncluded = false
            guard let key = line.components(separatedBy: "=").first else {
                return isIncluded
            }
            if !processedKeys.contains(key) {
                isIncluded = true
            }
            processedKeys.append(key)
            return isIncluded
        }
        return entries
    }
    
}
