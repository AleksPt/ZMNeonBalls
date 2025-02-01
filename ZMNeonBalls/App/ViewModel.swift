import SwiftUI

final class ViewModel: ObservableObject {
    private let firebaseDatabaseService = FirebaseDatabaseService.shared
    private let networkService = NetworkService.shared
    
    @Published var url: URL? {
        didSet {
            if let url {
                openWebView = true
            }
        }
    }
    
    @Published var isShowGame: Bool {
        didSet {
            if isShowGame == false {
                getFinalUrl()
            }
        }
    }
    
    @Published var openWebView: Bool = false
    
    init() {
        isShowGame = UserDefaults.standard.bool(forKey: UDKeys.showGame)
    }
    
    func getFinalUrl() {
        firebaseDatabaseService.getUrlFromDB { [weak self] stringUrl in
            guard let self else { return }
            
            guard let stringUrl else { return }
            
            networkService.fetchJsonData(from: stringUrl) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let success):
                    networkService.decodeJsonData(data: success) { [weak self] result in
                        guard let self else { return }
                        
                        switch result {
                        case .success(let successUrl):
                            url = successUrl
                            setIsShowGame(false)
                        case .failure(let failure):
                            setIsShowGame(true)
                            print(failure.rawValue)
                        }
                    }
                case .failure(let failure):
                    setIsShowGame(true)
                    print(failure.rawValue)
                }
            }
        }
    }
    
    func setIsShowGame(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: UDKeys.showGame)
    }
    
    func requestPermissionPush() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) {_, _ in }
    }
}
