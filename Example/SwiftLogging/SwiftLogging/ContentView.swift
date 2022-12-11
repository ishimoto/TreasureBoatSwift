//
//  ContentView.swift
//  SwiftLogging
//
//  Created by Ken Ishimoto on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("Hello, world!")

            // simple way to check if statements or some logic in the view
            Log.viewEvent("Before Button")
            
            Button {
                Log.info("clicked Button")
            } label: {
                Text("Log Me")
            }
            
            Log.viewEvent("After Button")

        }
        .padding()
        
        .onAppear() {
            Log.info("onAppear")
            
            test()
        }
        
    }
    
    func test() {
        // code logging sample
        Log.trace("trace")
        Log.debug("debug")
        Log.info("info")
        Log.warning("warn")
        Log.error("error")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
