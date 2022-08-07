//
//  SamplePage3.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/08/07.
//

import SwiftUI
import TreasureBoatSwift

struct SamplePage3: View {
    var body: some View {
        
        List {
            Section {
                TBSimpleFormRow(systemSymbol: .gear, titleText: "TBSimpleFormRow", secondaryText: "Secondary")
            } header: {
                Text("Row")
            }
        }
        
    }
}

struct SamplePage3_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SamplePage3()
        }
    }
}
