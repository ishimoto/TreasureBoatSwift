//
//  SamplePage4.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/08/07.
//

import SwiftUI
import TreasureBoatSwift

struct SamplePage4: View {
    var body: some View {
        VStack {
            Text("TBSFSymbol")
            TBSFSymbol(systemSymbol: .keyboard, backgroundColor: .orange, foregroundColor: .indigo)
            
            Spacer()
        }
    }
}

struct SamplePage4_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SamplePage4()
        }
    }
}
