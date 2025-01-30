//
//  Menu.swift
//  ZMNeonBalls
//
//  Created by Алексей on 28.01.2025.
//

import SwiftUI

struct Menu: Identifiable {
    let id = UUID()
    let titleCapsuleButton: String
    let card: Card
}

struct Card {
    let title: String
    let description: String?
    let imageBacground: Image
    let imageForeground: Image
    let newImage: Image
}
