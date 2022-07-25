//
//  BlueTriangleDemoApp.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 8/31/21.
//

import SwiftUI
import BlueTriangle

@main
struct BlueTriangleDemoApp: App {

    init() {
        BlueTriangle.configure { config in
            config.siteID = Constants.siteID
            // ...
        }
    }

    var body: some Scene {
        WindowGroup {
            TimerView(viewModel: TimerViewModel())
        }
    }
}
