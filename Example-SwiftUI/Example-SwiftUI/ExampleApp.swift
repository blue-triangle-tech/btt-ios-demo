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
        
        // Configure BlueTriangle
        BlueTriangle.configure { config in
            config.siteID = "bluetrianglesdk3280971z"
            config.networkSampleRate = 1.0
            config.enableScreenTracking = true
            config.enableDebugLogging = true
            config.ANRMonitoring = true
        }
       // BlueTriangle.metrics?["example-app"] = "custom1"
    }

    var body: some Scene {
        WindowGroup {
            TabContainerView(
                imageLoader: .live,
                service: .captured)
        }
    }
}
