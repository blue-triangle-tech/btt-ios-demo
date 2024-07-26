// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI
import BlueTriangle

public struct About: View {
    
    @Binding var isAboutActive : Bool
    
    public init(isAboutActive: Binding<Bool>) {
            self._isAboutActive = isAboutActive
    }
    
    public var body: some View {
        VStack {
            Text("About")
            
            Spacer()
            
            Text("Learn how to add the BlueTriangle SDK to private Swift packages (SPM) where you need its features within a single app.")
                .padding(.trailing, 20)
                .padding(.leading, 20)
            Spacer()
            
            Button("Back To Home") {
                self.isAboutActive = false
            }
        }
        .bttTrackScreen("About Screen")
        .padding()
    }
}
