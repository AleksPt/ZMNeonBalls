//
//  MenuViewModel.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    private let dataStore: DataStoreService = DataStoreService.shared
    private let storageService: StorageService = StorageService.shared
    @Published var menu: [Menu] = []
    @Published var achievement: [Achievement] = []
    @Published var achievementComboIsActive: String?
    @Published var achievementSpeedrunIsActive: String?
    @Published var achievementConnoisseurIsActive: String?
    
    init() {
        menu = dataStore.menu
        achievement = dataStore.achievements
        
        achievementComboIsActive = storageService.comboResult?.description
        achievementSpeedrunIsActive = storageService.speedrunResult?.description
        achievementConnoisseurIsActive = storageService.connoisseurResult?.description
    }
}
