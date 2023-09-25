//
//  SettingsView.swift
//
//  Created by Mathew Gacy on 10/27/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import BlueTriangle
import SwiftUI

struct SettingsView: View {
    @ObservedObject var vm: SettingsViewModel
    @State var isUnitTestsActive : Bool = false
    
    var body: some View {
        NavigationStack {
        
            VStack(spacing: 5){
                                
                VStack{
                    HStack{
                        Text("App Version")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text("\(version())")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("BTT SDK VersionRule")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text("feature/memory_warning_observer")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                       /* Text("master")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)*/
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("BTT SDK Location")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text(verbatim: "http://github.com/JP-aloha/btt-swift-sdk.git")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("Site Id")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text(vm.configureSiteId)
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                
                VStack{
                    HStack{
                        Text("ANR Detection")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text(vm.anrEnable ? "Enable" : "Disable")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("Screen Tracking")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text(vm.screenTrackingEnable ? "Enable" : "Disable")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("ANR Stack Trace")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text(vm.anrStackTraceEnable ? "Enable" : "Disable")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("Session Id")
                            .font(Font.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        Text(vm.configureSessionId)
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack(spacing: 10){
                    HStack{
                        
                        Button("TEST MANUAL TIMER") {
                            let timer = BlueTriangle.startTimer(
                                page: Page(
                                    pageName: "TEST MANUAL TIMER"))
                            BlueTriangle.endTimer(timer)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        
                        Spacer()
                    }
                    .frame(height: 45)
                }
                .frame(height: 50)
                
                Spacer()
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            .navigationTitle("Settings")
            .bttTrackScreen("SettingsView")
            .navigationDestination(isPresented: self.$isUnitTestsActive, destination: {
                UnitTestsView()
            })
            .onAppear{
                Thread.sleep(forTimeInterval: 3)
            }
        }
        
    }
    
    func version() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version) (\(build))"
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(vm: .init())
    }
}
