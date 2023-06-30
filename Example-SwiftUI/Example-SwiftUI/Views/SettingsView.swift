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

    var body: some View {
        VStack(spacing: 15){
            
            Spacer().frame(height:20)
            
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
                    Text("master")
                        .font(Font.system(size: 18, weight: .regular))
                        .foregroundColor(.gray)
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
                    Text("http://github.com/JP-aloha/btt-swift-sdk.git")
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
            
            Spacer()
        }
        .padding(.leading, 15)
        .padding(.trailing, 15)
        .onAppear {
                let timer = BlueTriangle.startTimer(
                    page: Page(
                        pageName: "Settings"))

                BlueTriangle.endTimer(timer)
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
