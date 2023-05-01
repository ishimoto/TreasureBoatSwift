//
//  TBNavigationRow.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/08/17.
//

import SwiftUI
import SFSafeSymbols

public struct TBNavigationRow: View {
    
    // MARK: - PROPERTIES

    var systemSymbol: SFSymbol
    var backgroundColor: Color
    var foregroundColor: Color
    var title: String
    var label: String
    var description: String
    var circleColor: Color
    var showLock: Bool = false
    var openIcon: Bool = false

    public init(systemSymbol: SFSymbol,
                backgroundColor: Color,
                foregroundColor: Color,
                title: String,
                label: String,
                description: String,
                circleColor: Color,
                showLock: Bool = false,
                openIcon: Bool = false) {
        self.systemSymbol = systemSymbol
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.label = label
        self.description = description
        self.circleColor = circleColor
        self.showLock = showLock
        self.openIcon = openIcon
    }

    // MARK: - BODY

    public var body: some View {
        
        HStack(spacing: 15) {
            TBSFSymbol(systemSymbol: systemSymbol,
                       backgroundColor: backgroundColor,
                       foregroundColor: foregroundColor)
            .overlay {
                if showLock {
                    if openIcon {
                        Image(systemSymbol: .lockOpenFill)
                            .foregroundColor(.green)
                            .offset(x: 18, y: 13)
                    } else {
                        Image(systemSymbol: .lockFill)
                            .foregroundColor(.red)
                            .offset(x: 18, y: 13)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                
                HStack {
                    Circle()
                        .frame(width: 16, height: 16)
                        .foregroundColor(circleColor)
                    
                    Text(title)
                        .fontWeight(.semibold)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                HStack {
                    
                    if !label.isEmpty {
                        Text(label)
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 1)
                            .background(Color.secondary)
                            .opacity(0.8)
                            .cornerRadius(5.0)
                    }
                    
                    Spacer()
                    
                    Text(description)
                        .fontWeight(.light)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            
        }
    }
}

#if os(iOS)
struct TBNavigationRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            TBNavigationRow(systemSymbol: .info,
                            backgroundColor: .benzaiten,
                            foregroundColor: .white,
                            title: "About TreasureBoat",
                            label: "Info",
                            description: "Information about TreasureBoat",
                            circleColor: .red,
                            showLock: true)
            .padding()
            
            TBNavigationRow(systemSymbol: .info,
                            backgroundColor: .benzaiten,
                            foregroundColor: .white,
                            title: "About TreasureBoat",
                            label: "Info",
                            description: "Information about TreasureBoat",
                            circleColor: .red,
                            showLock: false)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding()
        }
    }
}
#endif
