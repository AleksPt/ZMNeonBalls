import SwiftUI
import Combine
import AVFoundation

final class WebViewViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var progress: Double = 0.0
    
    private var cancellable: AnyCancellable?

    init() {
        cancellable = $isLoading
            .dropFirst()
            .filter { !$0 }
            .sink { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    guard let self else { return }
                    requestPermissionPush()
                    requestPermissionCamera()
                }
            }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    private func requestPermissionPush() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) {_, _ in }
    }
    
    private func requestPermissionCamera() {
        AVCaptureDevice.requestAccess(for: .video) { _ in }
    }
}
