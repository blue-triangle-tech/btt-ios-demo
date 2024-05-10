//
//  AppDelegate.swift
//
//  Created by Admin on 21/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import BlueTriangle

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let _ = BlueTriangle.launchMonitor
        self.registerNotifications()
        ConfigurationSetup.configOnLaunch()
        return true
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(forName: nil, object: nil, queue: nil) { notification in
            let isDelay = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigAddDelayKey)
            if isDelay {
                if notification.name == UIApplication.didFinishLaunchingNotification {
                    ConfigurationSetup.addDelay()
                } else if notification.name == UIApplication.willEnterForegroundNotification {
                    ConfigurationSetup.addDelay()
                }
            }
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }


}

