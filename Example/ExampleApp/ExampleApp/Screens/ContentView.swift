//
//  ContentView.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/06/22.
//

import SwiftUI
import TreasureBoatSwift

struct ContentView: View {
    var body: some View {
        
        NavigationView {
    
            VStack {
                Text("Welcome")
                    .font(.title)
                Divider()
                
                NavigationLink("String & Extensions") {
                    SampleString()
                }

                NavigationLink("Shape") {
                    SampleShape()
                }

                NavigationLink("Row") {
                    SampleRows()
                }

                NavigationLink("SFSymbol") {
                    SampleSymbol()
                }

                NavigationLink("Audio") {
                    SampleAudio()
                }

                NavigationLink("Color") {
                    SampleColor()
                }

                Spacer()
            }
            .navigationTitle("TreasureBoat Swift")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
        
    func testKatakana() -> String {
        return "カタカナ".toHiragana()!
    }

    func testHiragana() -> String {
        return "ひらがな".toKatakana()!
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
