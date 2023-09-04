//
//  ExampleApp.swift
//  Example-SwiftUI
//
//  Created by Mathew Gacy on 10/19/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import BlueTriangle
import SwiftUI

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
        
        let siteId = Secrets.siteID
        let enableDebugLogging = true
        let enableScreenTracking = true
        let enableAnrStackTrace = false
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
