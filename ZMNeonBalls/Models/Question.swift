//
//  Quiz.swift
//  ZMNeonBalls
//
//  Created by Алексей on 27.01.2025.
//

import SwiftUI

struct Question {
    let title: String
    let answers: [Answer]
}

struct Answer {
    let title: String?
    let image: Image?
    let isCorrect: Bool
}
