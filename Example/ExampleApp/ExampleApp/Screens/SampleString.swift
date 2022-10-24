//
//  SampleString.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/07/03.
//

import SwiftUI
import TreasureBoatSwift

struct SampleString: View {
    
    var body: some View {
    
        VStack {
            List {
                Section {
                    HStack {
                        Text("カタカナ")
                        Spacer()
                        Text(testKatakana())
                    }

                    HStack {
                        Text("ひらがな")
                        Spacer()
                        Text(testHiragana())
                    }

                } header: {
                    Text("Japan+")
                } //: Section
            
                Section {
                    HStack {
                        Text("FileExtension")
                        Spacer()
                        Text("https://www.treasureboat.org/test.img".fileExtension())
                    }

                    HStack {
                        Text("FileName")
                        Spacer()
                        Text("https://www.treasureboat.org/test.img".fileName())
                    }

                    
                } header: {
                    Text("String+")
                } //: Section

                Section {
                    HStack {
                        Text("applicationLanguage")
                        Spacer()
                        Text(TBLocalizer.sharedInstance.applicationLanguage())
                    }

                    HStack {
                        Text("deviceLanguage")
                        Spacer()
                        Text(TBLocalizer.sharedInstance.deviceLanguage())
                    }

                    HStack {
                        Text("isJapanese")
                        Spacer()
                        Text(TBLocalizer.sharedInstance.isJapanese(locale: Locale.current) ? "True" : "False")
                    }

                } header: {
                    Text("TBLocalizer")
                } //: Section

            } //: List
        }
        .navigationTitle("String & Extensions")

    }
    
    func testKatakana() -> String {
        return "カタカナ".toHiragana()!
    }

    func testHiragana() -> String {
        return "ひらがな".toKatakana()!
    }

}

struct SampleString_Previews: PreviewProvider {
    static var previews: some View {
        SampleString()
            .embedNavigationView()
    }
}
