import SwiftUI

@main
struct ZMNeonBallsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.isShowGame {
                LoadingGameView()
            } else {
                WebView()
                    .environmentObject(viewModel)
            }
        }
    }
}
