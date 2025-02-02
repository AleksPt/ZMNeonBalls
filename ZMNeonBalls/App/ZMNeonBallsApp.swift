import SwiftUI

@main
struct ZMNeonBallsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
