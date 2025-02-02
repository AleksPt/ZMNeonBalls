import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func assembleUrl(backUrl1: String, backUrl2: String) -> String {
        let urlPattern = #"^(https?:\/\/)?([\w\-]+\.)+[\w\-]+(\/[\w\-\/]*)?$"#
        let regex = try! NSRegularExpression(pattern: urlPattern)
        let range1 = NSRange(location: 0, length: backUrl1.utf16.count)
        
        let isBackUrl1Base = regex.firstMatch(in: backUrl1, options: [], range: range1) != nil
        
        let cleanBackUrl1 = backUrl1.replacingOccurrences(of: "https://", with: "")
        let cleanBackUrl2 = backUrl2.replacingOccurrences(of: "https://", with: "")
        
        var finalUrl: String
        if isBackUrl1Base {
            finalUrl = "https://" + cleanBackUrl1 + cleanBackUrl2
        } else {
            finalUrl = "https://" + cleanBackUrl2 + cleanBackUrl1
        }
        
        return finalUrl
    }
    
    private func assembleUrl1(backUrl1: String, backUrl2: String) -> String {
        let domainPattern = #"\.[\w]+\/"#
        let regex = try! NSRegularExpression(pattern: domainPattern)
        let range1 = NSRange(location: 0, length: backUrl1.utf16.count)
        
        let isBackUrl1Base = regex.firstMatch(in: backUrl1, options: [], range: range1) != nil
        
        let cleanBackUrl1 = backUrl1.replacingOccurrences(of: "https://", with: "")
        let cleanBackUrl2 = backUrl2.replacingOccurrences(of: "https://", with: "")
        
        var finalUrl = "https://"
        if isBackUrl1Base {
            finalUrl += cleanBackUrl1
            if !cleanBackUrl1.hasSuffix("?") && !cleanBackUrl2.hasPrefix("?") {
                finalUrl += "?"
            }
            finalUrl += cleanBackUrl2
        } else {
            finalUrl += cleanBackUrl2
            if !cleanBackUrl2.hasSuffix("?") && !cleanBackUrl1.hasPrefix("?") {
                finalUrl += "?"
            }
            finalUrl += cleanBackUrl1
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
        } catch {
            completion(.failure(.errorFromDecodeJsonData))
        }
    }
    
    func fetchJsonData(from urlString: String, completion: @escaping (Result<Data, ApiError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.badUrlFromFetchJsonData))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
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
