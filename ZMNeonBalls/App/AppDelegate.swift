import Foundation
import Firebase
import FacebookCore
import AppsFlyerLib
import FirebaseMessaging

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        #warning("доделать!")
//        RemoteConfigManager.shared.getDataAboutInit { success in
//            if success {
//                if RemoteConfigManager.shared.isFbEnabled {
//                    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
//                } else {
//                    print("facebook sdk disabled")
//                }
//                
//                if RemoteConfigManager.shared.isAppsEnabled {
//                    func applicationDidBecomeActive(_ application: UIApplication) {
//                        AppsFlyerLib.shared().start()
//                    }
//                    AppsFlyerLib.shared().appsFlyerDevKey = Constants.appsFlyerDevKey
//                    AppsFlyerLib.shared().appleAppID = Constants.appleAppID
//                    Constants.appFlyerId = AppsFlyerLib.shared().getAppsFlyerUID()
//                } else {
//                    print("appsflyer sdk disabled")
//                }
//            }
//        }
        
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
    -> UIBackgroundFetchResult {
        
        return UIBackgroundFetchResult.newData
    }
}


extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        if let token = fcmToken {
            Constants.firebaseCloudMessagingToken = token
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification) async
    -> UNNotificationPresentationOptions {
        return [[.badge, .banner, .sound]]
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken;
    }
}
