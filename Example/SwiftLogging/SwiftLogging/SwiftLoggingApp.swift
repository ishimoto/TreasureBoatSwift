//
//  SwiftLoggingApp.swift
//  SwiftLogging
//
//  Created by Ken Ishimoto on 2022/12/03.
//

import SwiftUI
import SwiftUILogger

@main
struct SwiftLoggingApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
        
    }
    
    
    class AppDelegate: NSObject, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            Log.register(logLevel: .info)

            return true
        }
    }

}
