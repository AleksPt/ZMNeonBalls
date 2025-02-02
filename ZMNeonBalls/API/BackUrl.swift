//
//  DTO.swift
//  ZMNeonBalls
//
//  Created by Алексей on 01.02.2025.
//

import Foundation

#warning("не забудь заменить обратно!")
//struct BackUrl: Decodable {
//    let backUrl1: String
//    let backUrl2: String
//}

struct BackUrl: Codable {
    let record: Record
}

struct Record: Codable {
    let backUrl1: String
    let backUrl2: String
}
