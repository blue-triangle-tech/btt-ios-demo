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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            BTTRootContrainerView(vm: BTTConfigModel())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        ConfigurationSetup.configOnLaunch()
        let isDelay = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigAddDelayKey)
        if isDelay {
            ConfigurationSetup.addDelay()
        }
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        let isDelay = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigAddDelayKey)
        if isDelay {
            ConfigurationSetup.addDelay()
        }
    }
}
