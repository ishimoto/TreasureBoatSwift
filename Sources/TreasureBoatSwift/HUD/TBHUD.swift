//
//  TBHUD.swift
//  HUDSample
//
//  Created by Ken Ishimoto on 2023/06/10.
//

import SwiftUI
import SFSafeSymbols

public class TBHUD: ObservableObject {
    
    @Published var isPresented = false
    
    private(set) var title = ""
    private(set) var subtitle = ""
    private(set) var systemImage = ""
    private(set) var systemImageColor = Color.accentColor

    public func show(title: String,
                     subtitle: String = "",
                     systemSymbol: SFSymbol,
                     systemImageColor: Color = .accentColor ) {
        
        self.title = title
        self.subtitle = subtitle
        self.systemImage = systemSymbol.rawValue
        self.systemImageColor = systemImageColor
        
        withAnimation {
            isPresented = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            withAnimation {
                self.isPresented = false
            }
        })
        
    }

    public func show(title: String,
                     subtitle: String = "",
                     systemImage: String,
                     systemImageColor: Color = .accentColor ) {
        
        self.title = title
        self.subtitle = subtitle
        self.systemImage = systemImage
        self.systemImageColor = systemImageColor
        
        withAnimation {
            isPresented = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            withAnimation {
                self.isPresented = false
            }
        })
        
    }
}
