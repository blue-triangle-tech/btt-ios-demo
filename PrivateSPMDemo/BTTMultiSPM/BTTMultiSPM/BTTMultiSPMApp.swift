//
//  BTTMultiSPMApp.swift
//  BTTMultiSPM
//
//  Created by Ashok Singh on 26/07/24.
//

import SwiftUI
import Intro
import About
import BlueTriangle

@main
struct BTTMultiSPMApp: App {
    
    @State private var showIntro = true
    @State private var showAbout = false
    
    init() {
        BlueTriangle.configure { config in
            config.siteID = "sdkdemo26621z"
            config.enableDebugLogging = true
        }
    }
    
    var body: some Scene {
        WindowGroup {
            if showIntro {
                Intro(isIntroActive: $showIntro)
            }
            else if showAbout {
                About(isAboutActive: $showAbout)
            }
            else{
                ContentView(isAboutActive:  $showAbout)
            }
        }
    }
}

