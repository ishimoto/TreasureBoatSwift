//
//  TBIntroScreen.swift
//
//
//  Created by Ken Ishimoto on 2023/12/17.
//

import SwiftUI

public struct TBIntroScreen: View {
    
    /// Visibility Status
    @AppStorage(TBConstant.AppStorage.IntroVersionNumber) var introVersionNumber: Int = 0
    
    @Environment(\.dismiss) private var dismiss
    
    var introData: ITBIntroProtocol
    
    public init(introData: ITBIntroProtocol) {
        self.introData = introData
    }
    
    public var body: some View {
        VStack(spacing: 15) {
            Text(introData.title)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            /// Points View
            VStack(alignment: .leading, spacing: 25, content: {
                ForEach(introData.pointViews, id: \.self) { pointView in
                    PointView(pointView: pointView)
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            
            Button(action: {
                introVersionNumber = introData.version
                
                dismiss()
                
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(introData.color, in: .rect(cornerRadius: 12))
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
                .foregroundStyle(introData.color)
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
