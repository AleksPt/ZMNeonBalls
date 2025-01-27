//
//  Ball.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import Foundation

struct Ball: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String
    let info: Info
    let fact: String
    let game: Game
}

struct Info {
    let country: String
    let size: String
    let material: String
    let ballStructure: String
    let characteristic: String
}

struct Game {
    let title: String
    let description: String
}
