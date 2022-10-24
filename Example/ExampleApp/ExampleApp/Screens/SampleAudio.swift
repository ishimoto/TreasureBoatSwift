//
//  SampleAudio.swift
//  ExampleApp
//
//  Created by Ken Ishimoto on 2022/10/13.
//

import SwiftUI
import TreasureBoatSwift

struct SampleAudio: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Button("play Click", action: {
                TBAudio.playClick()
            })
            
            Button("play Ding", action: {
                TBAudio.playDing()
            })
            
            Spacer()
        }
        .navigationTitle("Audio")
    }
}

struct SampleAudio_Previews: PreviewProvider {
    static var previews: some View {
        SampleAudio()
            .embedNavigationView()
    }
}
