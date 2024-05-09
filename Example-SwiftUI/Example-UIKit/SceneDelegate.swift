//
//  SceneDelegate.swift
//
//  Created by Admin on 21/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import BlueTriangle

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.configure()
        AppCoordinator.setupRootTabVc()
        //AppCoordinator.setupRootConfigVc()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    func configure(){
        
        ConfigurationModel.setupInitialDefaultConfiguration()
        
        let isDefaultSetting = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigDefaultKey)
        let enableScreenTracking = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigScreenTrackingKey)
        let anrMonitoring =  UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigANRKey)
        let enableMemoryWarning = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigMemoryWarningKey)
        let isPerformanceMonitor = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigPerfomanceMonitorKey)
        let isCrashTracking = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigCrashKey)
        let isNetworkState = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkStateKey)
        let isNetworkSampleRate = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkSampleRateKey)
        
        let siteId = Secrets.siteID
        let clarityProjectId = Secrets.clarityProjectID
        let enableDebugLogging = true
        let enableAnrStackTrace = false
        let sessionId = getSessionId()
        let sessionIdIdentifier  : Identifier = sessionId
        let claritySessionId =  "\(Int.random(in: 1000000..<9999999))"
        
        UserDefaults.standard.set(anrMonitoring, forKey: UserDefaultKeys.ANREnableKey)
        UserDefaults.standard.set(enableScreenTracking, forKey: UserDefaultKeys.ScreenTrackingEnableKey)
        UserDefaults.standard.set(siteId, forKey: UserDefaultKeys.ConfigureSiteId)
        UserDefaults.standard.set(enableAnrStackTrace, forKey: UserDefaultKeys.ANRStackTraceKey)
        UserDefaults.standard.set(sessionId, forKey: UserDefaultKeys.ConfigureSessionId)
        UserDefaults.standard.set(claritySessionId, forKey: UserDefaultKeys.ClaritySessionIdKey)
        UserDefaults.standard.synchronize()
        
        BlueTriangle.configure { config in
            config.siteID = siteId
            config.sessionID = sessionIdIdentifier
            config.enableDebugLogging = enableDebugLogging
            if !isDefaultSetting {
                config.networkSampleRate = isNetworkSampleRate ? 1.0 : 0.00
                config.crashTracking = isCrashTracking ? .nsException : .none
                config.enableScreenTracking = enableScreenTracking
                config.ANRMonitoring = anrMonitoring
                config.ANRStackTrace = enableAnrStackTrace
                config.enableMemoryWarning = enableMemoryWarning
                config.enableTrackingNetworkState = isNetworkState
                config.isPerformanceMonitorEnabled = isPerformanceMonitor
                config.cacheMemoryLimit = 20 * 1024
                config.cacheExpiryDuration = 5 * 60 * 1000
            }
        }
        
    }

    func getSessionId() -> Identifier{
        Identifier.random()
    }

}

