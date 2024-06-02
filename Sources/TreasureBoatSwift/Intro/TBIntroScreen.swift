//
//  TBIntroScreen.swift
//
//
//  Created by Ken Ishimoto on 2023/12/17.
//

import SwiftUI

public struct TBIntroScreen: View {
    
    /// Visibility Status
    @AppStorage(TBConstant.AppStorage.IntroVersionNumber) var introVersionNumber: String = "0"

    @Environment(\.dismiss) private var dismiss
    
    var title: String = "What's New in \nTreasureBoat"
    var color: Color = .red
    var pointViews: [TBIntroModel] = []

    public init(title: String, color: Color, pointViews: [TBIntroModel]) {
        self.title = title
        self.color = color
        self.pointViews = pointViews
    }
    
    public var body: some View {
        VStack(spacing: 15) {
            Text(title)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            /// Points View
            VStack(alignment: .leading, spacing: 25, content: {
                
                ForEach(pointViews, id: \.self) { pointView in
                    PointView(pointView: pointView)
                }
                
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            
            Button(action: {
                var number = Int(introVersionNumber) ?? 0
                number += 1
                introVersionNumber = String(number)
                
                dismiss()
                
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(color, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
    
    /// Point View
    @ViewBuilder
    func PointView(pointView: TBIntroModel) -> some View {
        HStack(spacing: 20) {
            Image(systemSymbol: pointView.systemSymbol)
                .font(.largeTitle)
                .foregroundStyle(color)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text(pointView.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(pointView.subTitle)
                    .font(.callout)
                    .foregroundStyle(.gray)
            })
        }
    }

}
