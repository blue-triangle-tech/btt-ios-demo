//
//  BlueTriangleDemoApp.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 8/31/21.
//

import SwiftUI
import BlueTriangleSDK_iOS

@main
struct BlueTriangleDemoApp: App {

    init() {
        BTTracker.shared().setSiteID(Constants.siteID)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
