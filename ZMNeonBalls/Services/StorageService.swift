//
//  StorageService.swift
//  ZMNeonBalls
//
//  Created by Алексей on 29.01.2025.
//

import Foundation

final class StorageService {
    static let shared = StorageService()
    var speedrunResult: Int?
    var connoisseurResult: Int?
    var comboResult: Int?
    
    private init() {
        updateResultAchievement()
    }
    
    func saveResultAchievement(value: Int, achievement: TypeAchievement) {
        switch achievement {
        case .speedrun:
            UserDefaults.standard.set(value, forKey: UDKeys.Achievment.speedrunResult)
        case .connoisseur:
            UserDefaults.standard.set(value, forKey: UDKeys.Achievment.connoisseurResult)
        case .combo:
            UserDefaults.standard.set(value, forKey: UDKeys.Achievment.comboResult)
        }
    }

    func getResultAchievement(forKey achievement: TypeAchievement) -> Int? {
        switch achievement {
        case .speedrun:
            UserDefaults.standard.integer(forKey: UDKeys.Achievment.speedrunResult)
        case .connoisseur:
            UserDefaults.standard.integer(forKey: UDKeys.Achievment.connoisseurResult)
        case .combo:
            UserDefaults.standard.integer(forKey: UDKeys.Achievment.comboResult)
        }
    }
    
    func updateResultAchievement() {
        speedrunResult = getResultAchievement(forKey: .speedrun)
        connoisseurResult = getResultAchievement(forKey: .connoisseur)
        comboResult = getResultAchievement(forKey: .combo)
    }
}
