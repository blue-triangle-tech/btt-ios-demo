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
        
        let siteId = Secrets.siteID
        let enableDebugLogging = true
        let enableScreenTracking = true
        let enableAnrStackTrace = true
        let anrMonitoring = true
        let sessionId = getSessionId()
        let sessionIdIdentifier  : Identifier = Identifier(sessionId) ?? 0
        
        UserDefaults.standard.set(anrMonitoring, forKey: UserDefaultKeys.ANREnableKey)
        UserDefaults.standard.set(enableScreenTracking, forKey: UserDefaultKeys.ScreenTrackingEnableKey)
        UserDefaults.standard.set(siteId, forKey: UserDefaultKeys.ConfigureSiteId)
        UserDefaults.standard.set(enableAnrStackTrace, forKey: UserDefaultKeys.ANRStackTraceKey)
        UserDefaults.standard.set(sessionId, forKey: UserDefaultKeys.ConfigureSessionId)
        UserDefaults.standard.synchronize()
        
        BlueTriangle.configure { config in
            config.siteID = siteId
            config.sessionID = sessionIdIdentifier
            config.networkSampleRate = 1.0
            config.crashTracking = .nsException
            config.enableDebugLogging = enableDebugLogging
            config.enableScreenTracking = enableScreenTracking
            config.ANRMonitoring = anrMonitoring
            config.ANRStackTrace = enableAnrStackTrace
        }
        
    }

    func getSessionId() -> String{
        let formatter = DateFormatter()
       // YYYYMMDDhhmm
        formatter.dateFormat = "YYYYMMddHHmm"
        let value = formatter.string(from: Date())
        return value
    }

}

