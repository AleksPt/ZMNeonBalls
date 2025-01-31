//
//  ZMNeonBallsApp.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import SwiftUI
import Firebase
import FacebookCore
import AppsFlyerLib
import FirebaseMessaging

@main
struct ZMNeonBallsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        return true
    }
}

