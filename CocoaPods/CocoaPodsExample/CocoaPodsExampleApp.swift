//
//  CocoaPodsExampleApp.swift
//  CocoaPodsExample
//
//  Created by Mathew Gacy on 1/19/23.
//  
//

import BlueTriangleSDK_Swift
import SwiftUI

@main
struct CocoaPodsExampleApp: App {
    init() {
        BlueTriangle.configure { config in
            config.siteID = "bluetriangledemo500z"
            // ...
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
