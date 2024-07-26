// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI
import BlueTriangle

public struct Intro: View {
    
    @Binding var isIntroActive : Bool
    
    public init(isIntroActive: Binding<Bool>) {
            self._isIntroActive = isIntroActive
    }
    
    public var body: some View {
        VStack {
 
            Text("Introduction")
            
            Spacer()
            
            Text("Welcome to the demo application showcasing the integration of the BlueTriangle SDK across multiple private swift packages (SPM) within a single app.")
                .padding(.trailing, 20)
                .padding(.leading, 20)
             .font(.headline)
             
            Spacer()
            
            Button("Continue") {
                self.isIntroActive = false
            }
        }
        .bttTrackScreen("Introduction Screen")
        .padding()
    }
}
