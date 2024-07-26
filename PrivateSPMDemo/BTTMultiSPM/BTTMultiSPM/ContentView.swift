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
            
            Text("This Home screen is part of the BTTMultiSPM App, while the other two screens is from two different private Swift package. the Introduction screen comes from the Intro Package (SPM), and the About screen comes from the About package(SPM)")
            
            Spacer()
            
            Button("Go To About") {
                self.isAboutActive = true
            }
        }
        .bttTrackScreen("Home View Screen")
        .padding()
    }
}

