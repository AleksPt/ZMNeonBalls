import SwiftUI
import AVFoundation

final class WebViewViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var progress: Double = 0.0
    
    func requestPermissionPush() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) {_, _ in }
    }
    
    func requestPermissionCamera() {
        AVCaptureDevice.requestAccess(for: .video) { _ in }
    }
}
