//
//  TBNoneScreen.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/05/02.
//

import SwiftUI

#if os(tvOS) || os(iOS)
public struct TBNoneScreen: View {
    
    public init() {
        // ...
    }
    
    public var body: some View {
        
        ZStack {
            Color.bishamontenLight
            
            VStack {
                Spacer()
                
                Image(assetName: TBConstant.HeadImage.nameForBishamonten)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.5)
                
                Spacer()
                
                Text("No Data to display.")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                
                Spacer()
            }
        }
        
        .edgesIgnoringSafeArea(.bottom)
        
#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
        .navigationTitle("No Data")
    }
}

struct TBNoneScreen_Previews: PreviewProvider {
    static var previews: some View {
        TBNoneScreen()
            .embedNavigationView()
    }
}
#endif
