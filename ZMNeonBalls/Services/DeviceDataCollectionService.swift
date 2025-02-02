import Foundation
import SwiftUI
import FirebaseMessaging

final class DeviceDataCollectionService {
    static let shared = DeviceDataCollectionService()
    
    private(set) var deviceData: [String: String] = [:]
    
    private init() {}
    
    func collectData() -> [String : String] {
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        var data: [String: String] = [:]
        
        guard let bundleId = Bundle.main.bundleIdentifier else { return [:] }
        let appsflyerId = Constants.appsFlyerID
        let devModel = UIDevice.current.model
        let batteryLevel = UIDevice.current.batteryLevel
        let batteryState = UIDevice.current.batteryState
        let tz = TimeZone.current.identifier
        let osVersion = UIDevice.current.systemVersion
        let uid = UUID().uuidString
        var battery_status = ""
        
        switch batteryState {
        case .charging:
            battery_status = "charging"
        case .unknown:
            battery_status = "battery status is unknown"
        default:
            battery_status = ""
        }
        
        data = [
            "bundle" : bundleId,
            "appsflyer_id" : appsflyerId,
            "devModel" : devModel,
            "battery_level" : String(Int(batteryLevel * 100)),
            "battery_status" : battery_status,
            "tz" : tz,
            "osVersion" : osVersion,
            "uid" : uid
        ]
        
        return data
    }
    
    func getDeviceData(completion: @escaping () -> Void) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            var data = self.collectData()
            
            Messaging.messaging().token { token, _ in
                if let token {
                    data["fcm_token"] = token
                }
                
                self.deviceData = data
                completion()
            }
        }
    }
    
    func encodeDeviceDataToBase64(data: [String: String]) -> String? {
        let queryItems = data.map { URLQueryItem(name: $0.key, value: $0.value) }
        var components = URLComponents()
        components.queryItems = queryItems
        
        guard let queryString = components.query?.data(using: .utf8) else {
            return nil
        }
        
        return queryString.base64EncodedString()
    }
}
