//
//  SampleRows.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/08/07.
//

import SwiftUI
import TreasureBoatSwift

struct SampleRows: View {
    var body: some View {
        List {
            Section {
                TBSimpleFormRow(systemSymbol: .gear, titleText: "TBSimpleFormRow", secondaryText: "Secondary")
            } header: {
                Text("Row")
            }
        }
        
        .navigationTitle("Rows")
    }
}

struct SampleRows_Previews: PreviewProvider {
    static var previews: some View {
        SampleRows()
            .embedNavigationView()
    }
}
