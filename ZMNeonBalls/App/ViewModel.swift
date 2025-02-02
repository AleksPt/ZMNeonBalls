import SwiftUI

final class ViewModel: ObservableObject {
    private let firebaseDatabaseService = FirebaseDatabaseService.shared
    private let networkService = NetworkService.shared
    
    var url: URL?
    
    @Published var isShowGame: Bool
    
    init() {
        let isShowGameUD = UserDefaults.standard.bool(forKey: UDKeys.showGame)
        isShowGame = isShowGameUD
        
        guard !isShowGame else { return }
        
        let urlStringUD = UserDefaults.standard.string(forKey: UDKeys.url)
        
        guard let urlStringUD else {
            getFinalUrl()
            return
        }
        
        url = URL(string: urlStringUD)
    }
    
    func getFinalUrl() {
        firebaseDatabaseService.getUrlFromDB { [weak self] stringUrl in
            guard let self else { return }
            
            guard let stringUrl else {
                isShowGame = true
                saveUDisShowGame(true)
                return
            }
            
            networkService.fetchJsonData(from: stringUrl) { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let success):
                    networkService.decodeJsonData(data: success) { [weak self] result in
                        guard let self else { return }
                        
                        switch result {
                        case .success(let successUrl):
                            url = successUrl
                            saveUDisShowGame(false)
                            saveUDurlString(successUrl)
                        case .failure(let failure):
                            isShowGame = true
                            saveUDisShowGame(true)
                            print(failure.rawValue)
                        }
                    }
                case .failure(let failure):
                    isShowGame = true
                    saveUDisShowGame(true)
                    print(failure.rawValue)
                }
            }
        }
    }
        
    func requestPermissionPush() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) {_, _ in }
    }
    
    private func saveUDisShowGame(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: UDKeys.showGame)
    }

    private func saveUDurlString(_ url: URL) {
        let urlString = url.absoluteString
        UserDefaults.standard.set(urlString, forKey: UDKeys.showGame)
    }
}
