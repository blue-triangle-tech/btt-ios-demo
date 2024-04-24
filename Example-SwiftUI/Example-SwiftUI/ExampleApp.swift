//
//  ExampleApp.swift
//  Example-SwiftUI
//
//  Created by Mathew Gacy on 10/19/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import BlueTriangle
import SwiftUI
import Clarity

@main
struct Example_SwiftUIApp: App {
    init() {
        configure()
    }
    
    var body: some Scene {
        WindowGroup {
            BTTRootContrainerView(vm: BTTConfigModel())
        }
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
            if !isDefaultSetting {
                config.networkSampleRate = isNetworkSampleRate ? 1.0 : 0.00
                config.crashTracking = isCrashTracking ? .nsException : .none
                config.enableDebugLogging = enableDebugLogging
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
        
        ClaritySDK.initialize(config: ClarityConfig(projectId: clarityProjectId))
        ClaritySDK.setCustomSessionId(claritySessionId)
    }

    func getSessionId() -> Identifier{
        Identifier.random()
    }
}
