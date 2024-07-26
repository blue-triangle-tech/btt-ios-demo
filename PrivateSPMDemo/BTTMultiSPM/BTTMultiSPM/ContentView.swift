//
//  ContentView.swift
//  BTTMultiSPM
//
//  Created by Ashok Singh on 26/07/24.
//

import SwiftUI
import BlueTriangle
import About

struct ContentView: View {
    
    @Binding var isAboutActive : Bool
    
    var body: some View {
        VStack {
            Text("Home View")
            
            Spacer()
            
            Text("The Home screen is part of the BTTMultiSPM App, while the other two screens is from two different SDKs. the Introduction screen comes from the Intro Package (SPM), and the About screen also originates from the Intro Package(SPM)")
            
            Spacer()
            
            Button("Go To About") {
                self.isAboutActive = true
            }
        }
        .bttTrackScreen("Home View Screen")
        .padding()
    }
}

