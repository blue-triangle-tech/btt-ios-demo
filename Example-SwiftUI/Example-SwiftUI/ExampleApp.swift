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
        self.registerNotifications()
        ConfigurationSetup.configOnLaunch()
    }
    
    var body: some Scene {
        WindowGroup {
            BTTRootContrainerView(vm: BTTConfigModel())
        }
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
}
