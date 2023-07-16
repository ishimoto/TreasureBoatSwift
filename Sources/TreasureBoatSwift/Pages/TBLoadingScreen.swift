//
//  TBLoadingScreen.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/05/02.
//

import SwiftUI

#if os(tvOS) || os(iOS)
public struct TBLoadingScreen: View {
        
    public init() {
        // ...
    }
    
    public var body: some View {
        
        ZStack {
            Color.ebisuLight
            
            VStack {
                Spacer()

                Image(assetName: TBConstant.HeadImage.nameForEbisu)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.5)
                
                Spacer()
                
                HStack {
                    ProgressView()
                    Text(" Loading ...")
                        .font(.title3)
                }
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
        .navigationTitle("Loading")
    }
}

struct TBLoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        TBLoadingScreen()
            .embedNavigationView()
    }
}
#endif
