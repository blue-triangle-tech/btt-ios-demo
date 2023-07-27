//
//  AppDelegate.swift
//  CocoaPodsExample
//
//  Created by Mathew Gacy on 3/6/23.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import BlueTriangle
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Configure Blue Triangle SDK
        BlueTriangle.configure { config in
            config.siteID = Configuration.siteID
            config.sessionID = 12121212
            config.networkSampleRate = 1.0
            config.crashTracking = .nsException
            config.enableDebugLogging = true
            config.enableScreenTracking = true
            config.ANRMonitoring = true
            config.ANRStackTrace = true
            // ...
        }

        return true
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
}
