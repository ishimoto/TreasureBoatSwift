//
//  TBFlowView.swift
//
//
//  Created by Alex Nagy on 05.08.2022.
//

import SwiftUI

/// `https://store.rebeloper.com/flow-view`
public struct TBFlowView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    
    let data: Data
    let vSpacing: CGFloat
    let hSpacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    
    @State private var availableWidth: CGFloat = 0
    
    public init(_ data: Data,
                vSpacing: CGFloat = 0,
                hSpacing: CGFloat = 6,
                alignment: HorizontalAlignment = .leading,
                content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.vSpacing = vSpacing
        self.hSpacing = hSpacing
        self.alignment = alignment
        self.content = content
    }
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                    availableWidth = size.width
                }
            
            TBFlexibleView(
                availableWidth: availableWidth,
                data: data,
                vSpacing: vSpacing,
                hSpacing: hSpacing,
                alignment: alignment,
                content: content
            )
        }
    }
}

/// This view is responsible to lay down the given elements and wrap them into
/// multiple rows if needed.
struct TBFlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let vSpacing: CGFloat
    let hSpacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body : some View {
        VStack(alignment: alignment, spacing: vSpacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: hSpacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + hSpacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - (elementSize.width + hSpacing)
        }
        
        return rows
    }
}
