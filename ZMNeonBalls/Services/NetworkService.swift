import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func assembleUrl(backUrl1: String, backUrl2: String) -> String {
        let urlPattern = #"^(https?:\/\/)?([\w\-]+\.)+[\w\-]+(\/[\w\-\/]*)?$"#
        let range = NSRange(location: 0, length: backUrl1.utf16.count)
        
        let regex = try! NSRegularExpression(pattern: urlPattern)
        
        let isBackUrl1Base = regex.firstMatch(in: backUrl1, options: [], range: range) != nil
        
        var finalUrl: String
        if isBackUrl1Base {
            finalUrl = "https://" + backUrl1 + backUrl2
        } else {
            finalUrl = "https://" + backUrl2 + backUrl1
        }
        return finalUrl
    }
    
    private func assembleUrl1(backUrl1: String, backUrl2: String) -> String {
        let domainPattern = #"\.[\w]+\/"#
        let regex = try! NSRegularExpression(pattern: domainPattern)
        let range = NSRange(location: 0, length: backUrl1.utf16.count)
        let isBackUrl1Base = regex.firstMatch(in: backUrl1, options: [], range: range) != nil
        
        var finalUrl = "https://"
        if isBackUrl1Base {
            finalUrl += backUrl1
            if !backUrl1.hasSuffix("?") && !backUrl2.hasPrefix("?") {
                finalUrl += "?"
            }
            finalUrl += backUrl2
        } else {
            finalUrl += backUrl2
            if !backUrl2.hasSuffix("?") && !backUrl1.hasPrefix("?") {
                finalUrl += "?"
            }
            finalUrl += backUrl1
        }
        
        return finalUrl
    }
    
    func decodeJsonData(data: Data, completion: @escaping (Result<URL, ApiError>) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(BackUrl.self, from: data)
            
            if let url = URL(
                string: assembleUrl(
                    backUrl1: decodedData.backUrl1,
                    backUrl2: decodedData.backUrl2
                )
            ) {
                completion(.success(url))
            } else if let url = URL(
                string: assembleUrl1(
                    backUrl1: decodedData.backUrl1,
                    backUrl2: decodedData.backUrl2
                )
            ) {
                completion(.success(url))
            } else {
                throw ApiError.badFinalUrl
            }
        } catch let error {
            completion(.failure(.errorFromDecodeJsonData))
        }
    }
    
    func fetchJsonData(from urlString: String, completion: @escaping (Result<Data, ApiError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrlFromFetchJsonData))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.errorFromFetchJsonData))
                return
            }
            
            guard let data = data else {
                completion(.failure(.failDataFromFetchJsonData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
