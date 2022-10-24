//
//  SamplePage4.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/08/07.
//

import SwiftUI
import TreasureBoatSwift

struct SampleSymbol: View {
    var body: some View {
        VStack {
            TBSFSymbol(systemSymbol: .keyboard, backgroundColor: .orange, foregroundColor: .indigo)
            
            Spacer()
        }
        .navigationTitle("TBSFSymbol")
    }
}

struct SampleSymbol_Previews: PreviewProvider {
    static var previews: some View {
        SampleSymbol()
            .embedNavigationView()
    }
}
