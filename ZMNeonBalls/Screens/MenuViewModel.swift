//
//  MenuViewModel.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    @Published var menu: [Menu] = []
    @Published var achievement: [Achievement] = []
    private let dataStore: DataStoreService = DataStoreService.shared
    
    init() {
        menu = dataStore.menu
        achievement = dataStore.achievements
    }
}
