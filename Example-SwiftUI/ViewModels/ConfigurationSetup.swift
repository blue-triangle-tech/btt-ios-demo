//
//  ConfigurationSetup.swift
//
//  Created by Ashok Singh on 09/05/24.
//  Copyright © 2024 Blue Triangle. All rights reserved.
//

import BlueTriangle
import Foundation

class ConfigurationSetup {

    static func configOnLaunch(){
        let isCofigOnLaunchTime = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigOnLaunchTimeKey)
        if isCofigOnLaunchTime {
            configure()
        }
    }
    
    static func configOnOtherScreen(){
        let isCofigOnLaunchTime = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigOnLaunchTimeKey)
        if !isCofigOnLaunchTime {
            configure()
        }
    }
    
    static func configure(){
        
        ConfigurationModel.setupInitialDefaultConfiguration()
        
        let isDefaultSetting = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigDefaultKey)
        let enableScreenTracking = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigScreenTrackingKey)
        let anrMonitoring =  UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigANRKey)
        let enableMemoryWarning = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigMemoryWarningKey)
        let isPerformanceMonitor = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigPerfomanceMonitorKey)
        let isCrashTracking = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigCrashKey)
        let isNetworkState = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkStateKey)
        let isNetworkSampleRate = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkSampleRateKey)
        let isLaunchTime = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigLaunchTimeKey)
        
        let siteId = Secrets.siteID
        let enableDebugLogging = true
        let enableAnrStackTrace = false
        let sessionId = getSessionId()
        let sessionIdIdentifier  : Identifier = sessionId
        
        UserDefaults.standard.set(anrMonitoring, forKey: UserDefaultKeys.ANREnableKey)
        UserDefaults.standard.set(enableScreenTracking, forKey: UserDefaultKeys.ScreenTrackingEnableKey)
        UserDefaults.standard.set(siteId, forKey: UserDefaultKeys.ConfigureSiteId)
        UserDefaults.standard.set(enableAnrStackTrace, forKey: UserDefaultKeys.ANRStackTraceKey)
        UserDefaults.standard.set(sessionId, forKey: UserDefaultKeys.ConfigureSessionId)
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
                config.enableLaunchTime = isLaunchTime
            }
        }
    }

    static func getSessionId() -> Identifier{
        Identifier.random()
    }
    
    static func addDelay(){
        let startTime = Date()
        while true {
            if (Date().timeIntervalSince1970 - startTime.timeIntervalSince1970) > 3 {
                break
            }
        }
    }
}
