import SwiftUI

final class SpashScreenViewModel: ObservableObject {
    private let firebaseDatabaseService = FirebaseDatabaseService.shared
    private let networkService = NetworkService.shared

    @Published var viewState: SplashScreen.ViewState = .loading
    
    init() {
        setViewState()
    }
    
    func getFinalUrl() {
        firebaseDatabaseService.getUrlFromDB { [weak self] stringUrl in
            guard let self else { return }
            
            guard let stringUrl else {
                saveUDisShowGame(true)
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    viewState = .game
                }
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
                            saveUDisShowGame(false)
                            saveUDurlString(successUrl)
                            DispatchQueue.main.async { [weak self] in
                                guard let self else { return }
                                viewState = .webview(successUrl)
                            }
                        case .failure(_):
                            saveUDisShowGame(true)
                            DispatchQueue.main.async { [weak self] in
                                guard let self else { return }
                                viewState = .game
                            }
                        }
                    }
                case .failure(_):
                    saveUDisShowGame(true)
                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        viewState = .game
                    }
                }
            }
        }
    }
    
    private func saveUDisShowGame(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: UDKeys.showGame)
    }

    private func saveUDurlString(_ url: URL) {
        UserDefaults.standard.set(url, forKey: UDKeys.url)
    }
    
    private func setViewState() {
        let isShowGameUD = UserDefaults.standard.bool(forKey: UDKeys.showGame)
        let url = UserDefaults.standard.url(forKey: UDKeys.url)
        
        guard !isShowGameUD else {
            viewState = .game
            return
        }
        
        if let url {
            viewState = .webview(url)
        } else {
            getFinalUrl()
        }
    }
}

extension SplashScreen {
    enum ViewState {
        case loading
        case game
        case webview(URL)
    }
}

