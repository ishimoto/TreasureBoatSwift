//
//  TBFailureScreen.swift
//  TB Mobile
//
//  Created by Ken Ishimoto on 2021/05/02.
//

import SwiftUI

#if os(tvOS) || os(iOS)
public struct TBFailureScreen: View {
    
    var message: String
    
    public init(message: String) {
        self.message = message
    }
    
    public var body: some View {
        
        ZStack {
            Color.daikokuLight
            
            VStack {
                Spacer()
                                
                Image(assetName: TBConstant.HeadImage.nameForDaikoku)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.5)
                
                Spacer()
                
                Text("Error\n\(message)")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.bottom)

#if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
#endif
        .navigationTitle("Error")
    }
}

struct TBFailureScreen_Previews: PreviewProvider {
    static var previews: some View {
        TBFailureScreen(message: "some error message.")
            .embedNavigationView()
    }
}
#endif
