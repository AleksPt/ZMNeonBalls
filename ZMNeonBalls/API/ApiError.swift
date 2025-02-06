import Foundation

enum ApiError: String, Error {
    case badFinalUrl
    case badUrlFromFetchJsonData
    case failDataFromFetchJsonData
    case errorFromDecodeJsonData
    case errorFromFetchJsonData
    case emptyUrl
}
