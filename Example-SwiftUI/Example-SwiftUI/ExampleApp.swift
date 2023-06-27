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
    var body: some Scene {
        WindowGroup {
            BTTRootContrainerView(vm: BTTConfigModel())
        }
    }
}
