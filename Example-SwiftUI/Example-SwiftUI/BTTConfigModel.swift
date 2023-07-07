//
//  BTTConfigModel.swift
//
//  Created by Ashok Singh on 27/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation

import Foundation
import Combine
import BlueTriangle

class BTTConfigModel: ObservableObject {

    @Published var isConfigurationScreen : Bool = true
    @Published var txtSiteId : String =  Secrets.siteID
    @Published var anrEnable : Bool = false
    @Published var screenTrackingEnable : Bool = false
    @Published var anrStackTrace : Bool = false
    
    func configure(){
        
        if txtSiteId.count > 0 {
            
            UserDefaults.standard.set(anrEnable, forKey: UserDefaultKeys.ANREnableKey)
            UserDefaults.standard.set(screenTrackingEnable, forKey: UserDefaultKeys.ScreenTrackingEnableKey)
            UserDefaults.standard.set(txtSiteId, forKey: UserDefaultKeys.ConfigureSiteId)
            
            UserDefaults.standard.set(anrStackTrace, forKey: UserDefaultKeys.ANRStackTraceKey)
            UserDefaults.standard.synchronize()
            
            BlueTriangle.configure { config in
                config.siteID = txtSiteId
                config.networkSampleRate = 1.0
                config.enableDebugLogging = true
                config.crashTracking = .nsException
                config.enableScreenTracking = screenTrackingEnable
                config.ANRMonitoring = anrEnable
                config.ANRStackTrace = anrStackTrace
            }
            
            // BlueTriangle.metrics?["example-app"] = "custom1"
            
            isConfigurationScreen = false
        }
    }
    
}
