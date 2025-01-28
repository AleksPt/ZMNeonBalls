//
//  Achievement.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

enum TypeAchievement: String {
    case speedrun, connoisseur, combo
    
    var image: Image {
        switch self {
        case .speedrun:
            K.Images.Balls.beachBall
        case .connoisseur:
            K.Images.Balls.tableTennisBall
        case .combo:
            K.Images.Balls.golfBall
        }
    }
    
    var title: String {
        self.rawValue.uppercased()
    }
}

struct Achievement: Identifiable {
    let id = UUID()
    let type: TypeAchievement
    let image: Image
    let title: String
    let description: String
}
