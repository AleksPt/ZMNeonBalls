//
//  DTO.swift
//  ZMNeonBalls
//
//  Created by Алексей on 01.02.2025.
//

import Foundation

struct BackUrl: Codable {
    let backUrl1: String
    let backUrl2: String

    private enum CodingKeys: String, CodingKey {
        case backUrl1 = "pally"
        case backUrl2 = "daisy"
    }
}
