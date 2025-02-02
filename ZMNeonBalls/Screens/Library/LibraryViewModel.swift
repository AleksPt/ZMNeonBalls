import Foundation

final class LibraryViewModel: ObservableObject {
    @Published var balls: [Ball] = []
    private let dataStore: DataStoreService = DataStoreService.shared
    
    init() {
        balls = dataStore.balls
    }
}
