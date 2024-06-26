//
//  TBPocketView.swift
//
//  Created by Alex Nagy on 17.01.2023.
//

import SwiftUI

public struct TBPocketView<Data, ToolbarItem: View, Content: View>: View {
    
    @Binding public var selection: Int
    public var data: [Data]
    public var alignment: ETBPocketViewToolbarAlignment
    @ViewBuilder public var toolbarItem: (Int) -> ToolbarItem
    @ViewBuilder public var content: (Int) -> Content
    
    public init(_ selection: Binding<Int>, data: [Data], alignment: ETBPocketViewToolbarAlignment = .top, toolbarItem: @escaping (Int) -> ToolbarItem, content: @escaping (Int) -> Content) {
        self._selection = selection
        self.data = data
        self.alignment = alignment
        self.toolbarItem = toolbarItem
        self.content = content
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            switch alignment {
            case .top:
                ScrollViewReader { proxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            TBPocketToolbarItem(selection: $selection, data: data) { index in
                                toolbarItem(index)
                                    .id(index)
                            }
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                            withAnimation {
                                proxy.scrollTo(selection, anchor: .leading)
                            }
                        })
                        
                    }
                }
                
                ZStack {
                    TBPocketContent(selection: $selection, data: data) { index in
                        content(index)
                    }
                    
                }
            case .bottom:
                ZStack {
                    TBPocketContent(selection: $selection, data: data) { index in
                        content(index)
                    }
                    
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        TBPocketToolbarItem(selection: $selection, data: data) { index in
                            toolbarItem(index)
                        }
                    }
                }
            }
            
        }
    }
}

