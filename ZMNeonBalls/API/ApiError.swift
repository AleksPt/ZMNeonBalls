//
//  ApiError.swift
//  ZMNeonBalls
//
//  Created by Алексей on 01.02.2025.
//

import Foundation

enum ApiError: String, Error {
    case badFinalUrl
    case badUrlFromFetchJsonData
    case failDataFromFetchJsonData
    case errorFromDecodeJsonData
    case errorFromFetchJsonData
}
