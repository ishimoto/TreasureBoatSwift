//
//  SampleShape.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/07/03.
//

import SwiftUI
import TreasureBoatSwift

struct SampleShape: View {
    var body: some View {
        VStack {
            ZStack {
                TBShapeRoundedCorners(corners: [.topLeft, .topRight], radius: 35)
                    .padding()
                    .frame(width: 400, height: 300)
                
                Text("TBShapeRoundedCorners")
                    .foregroundColor(.white)
                    .padding()
            }
            
            Spacer()
            
        }
        .navigationTitle("Shape")
    }
}

struct SampleShape_Previews: PreviewProvider {
    static var previews: some View {
        SampleShape()
            .embedNavigationView()
    }
}
