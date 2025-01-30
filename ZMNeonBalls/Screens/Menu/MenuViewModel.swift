//
//  MenuViewModel.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    private let dataStore: DataStoreService = DataStoreService.shared
    let storageService: StorageService = StorageService.shared
    @Published var menu: [Menu] = []
    @Published var achievement: [Achievement] = []
    
    @Published var connoisseur = "0/20"
    @Published var combo = "0"
    @Published var speedrun = "0"
        
    private var achievementComboIsActive: Int?
    private var achievementSpeedrunIsActive: Int?
    private var achievementConnoisseurIsActive: Int?
    
    private var connoisseurTmp: String {
        return "\(achievementConnoisseurIsActive ?? 0)" + "/" + "\(dataStore.questions.count)"
    }
    private var comboTmp: String {
        return achievementComboIsActive?.description ?? "0"
    }
    private var speedrunTmp: String {
        if let allTime = achievementSpeedrunIsActive {
            let minutes = allTime / 60
            let seconds = allTime % 60
            return String(format: "%02d:%02d", minutes, seconds)
        } else {
            return "0:00"
        }
    }
    
    init() {
        menu = dataStore.menu
        achievement = dataStore.achievements
    }
    
    func getAchievements() {
        achievementComboIsActive = storageService.comboResult
        achievementSpeedrunIsActive = storageService.speedrunResult
        achievementConnoisseurIsActive = storageService.connoisseurResult
    }
    
    func updateAchievements() {
        connoisseur = connoisseurTmp
        combo = comboTmp
        speedrun = speedrunTmp
    }
}
