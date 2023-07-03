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
        NavigationStack {
            VStack{
                Text("App Version : \(version())")
                    .font(Font.system(size: 20, weight: .bold))
                    .padding(.bottom, 50)
                
                HStack{
                    Text("Site Id :")
                        .font(Font.system(size: 18, weight: .regular))
                    Spacer()
                    Text(vm.configureSiteId)
                        .font(Font.system(size: 18, weight: .bold))
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
                HStack{
                    Toggle("ANR Enable", isOn: $vm.anrEnable)
                        .disabled(true)
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
                HStack{
                    Toggle("Screen Tracking Enable", isOn: $vm.screenTrackingEnable)
                        .disabled(true)
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                
                Text ("BTT SDK VersionRule:")
                    .padding(.top, 30)
                    .foregroundColor(.gray)
                    .font(Font.system(size: 16, weight: .bold))
                Text ("master")
                    .padding(.top, 1)
                    .font(Font.system(size: 15, weight: .bold))
                
                //location
                Text("BTT SDK Location:")
                    .foregroundColor(.gray)
                    .padding(.top, 30)
                    .font(Font.system(size: 16, weight: .bold))
                Text(verbatim: "http://github.com/JP-aloha/btt-swift-sdk.git")
                    .padding(.top, 1)
                    .font(Font.system(size: 15, weight: .bold))
                    .foregroundColor(.accentColor)
            }
            
            .onAppear {
                let timer = BlueTriangle.startTimer(
                    page: Page(
                        pageName: "Settings"))
                
                BlueTriangle.endTimer(timer)
            }
            .navigationTitle("Settings")
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
