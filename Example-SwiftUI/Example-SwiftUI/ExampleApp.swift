//
//  ExampleApp.swift
//  Example-SwiftUI
//
//  Created by Mathew Gacy on 10/19/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import BlueTriangle
import SwiftUI
import UIKit

@main
struct Example_SwiftUIApp: App {
    
    init() {
        ConfigurationSetup.configOnLaunch()
        registerNotifications()
    }
    
    
    var body: some Scene {
        WindowGroup {
            BTTRootContrainerView(vm: BTTConfigModel())
        }
    }
    
    
    private func registerNotifications() {
        
        NotificationCenter.default.addObserver(forName: UIApplication.didFinishLaunchingNotification, object: nil, queue: nil) { notification in
            let isDelay = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigAddDelayKey)
            if isDelay {
                ConfigurationSetup.addDelay()
            }
        }
        NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: nil) { notification in
            let isDelay = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigAddDelayKey)
            if isDelay {
                ConfigurationSetup.addDelay()
            }
        }
    }
}

