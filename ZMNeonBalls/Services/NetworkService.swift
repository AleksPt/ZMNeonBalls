import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func decodeJsonData(data: Data, completion: @escaping (Result<URL, ApiError>) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(BackUrl.self, from: data)
            
            guard !decodedData.backUrl1.isEmpty && !decodedData.backUrl2.isEmpty else {
                print(ApiError.emptyUrl.rawValue)
                throw ApiError.emptyUrl
            }
            
            if let url = URL(string: decodedData.backUrl1 + decodedData.backUrl2) {
                completion(.success(url))
            } else {
                print(ApiError.badFinalUrl.rawValue)
                throw ApiError.badFinalUrl
            }
        } catch {
            completion(.failure(.errorFromDecodeJsonData))
            print(ApiError.errorFromDecodeJsonData.rawValue)
        }
    }
    
    func fetchJsonData(from urlString: String, completion: @escaping (Result<Data, ApiError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            print(ApiError.badUrlFromFetchJsonData.rawValue)
            completion(.failure(.badUrlFromFetchJsonData))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                print(ApiError.errorFromFetchJsonData.rawValue)
                completion(.failure(.errorFromFetchJsonData))
                return
            }
            
            guard let data = data else {
                print(ApiError.failDataFromFetchJsonData.rawValue)
                completion(.failure(.failDataFromFetchJsonData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
