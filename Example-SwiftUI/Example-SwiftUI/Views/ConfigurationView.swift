//
//  ConfigurationView.swift
//
//  Created by Ashok Singh on 16/04/24.
//  Copyright © 2024 Blue Triangle. All rights reserved.
//

import SwiftUI

struct ConfigurationView: View {
    
    @Binding var isConfigurationActive : Bool
    @ObservedObject var vm : ConfigurationModel  
    @State private var showConfirm = false
    
    var body: some View {
        HStack{
            VStack(spacing: 10) {
                
                VStack{
                    HStack{
                        Button("Cancel") {
                            isConfigurationActive = false
                        }
                        Spacer()
                        Text("Configuration")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        Button("Apply") {
                            vm.applyChanges()
                            exit(0)
                        }
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("Kepp Default Configurations")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isConfigDefault)
                            .onChange(of: self.vm.isConfigDefault, perform: { value in
                                vm.updateDefaultConfig(value)
                            })
                    }
                }
                .frame(height: 100)
                
                VStack{
                    HStack{
                        Text("Screen Tracking")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isScreenTracking)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isScreenTracking, perform: { value in
                                vm.updateScreenTrackingConfig(value)
                            })
                    }
                }
                .frame(height: 30)
                
                VStack{
                    HStack{
                        Text("Perfomance Monitoring")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isPerfomanceMonitor)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isPerfomanceMonitor, perform: { value in
                                vm.updatePerfomanceMonitorConfig(value)
                            })
                    }
                }
                .frame(height: 30)
                
                
                VStack{
                    HStack{
                        Text("Crash Tracking")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isCrashTracking)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isCrashTracking, perform: { value in
                                vm.updateCrash(value)
                            })
                    }
                }
                .frame(height: 30)
                
                VStack{
                    HStack{
                        Text("ANR Tracking")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isANR)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isANR, perform: { value in
                                vm.updateANRConfig(value)
                            })
                    }
                }
                .frame(height: 30)
                
                VStack{
                    HStack{
                        Text("Memory Warning")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isMemoryWarning)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isMemoryWarning, perform: { value in
                                vm.updateMemoryWarningConfig(value)
                            })
                    }
                }
                .frame(height: 30)


                
                VStack{
                    HStack{
                        Text("Network Capturing")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isNetworkSampleRate)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isNetworkSampleRate, perform: { value in
                                vm.updateNetworkSampleRate(value)
                            })
                    }
                }
                .frame(height: 30)
                
                VStack{
                    HStack{
                        Text("Network State Tracking")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isNetworkState)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isNetworkState, perform: { value in
                                vm.updateNetworkState(value)
                            })
                    }
                }
                .frame(height: 30)
                
                VStack{
                    HStack{
                        Text("Launch Time")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isLaunchTime)
                            .disabled(vm.isConfigDefault)
                            .onChange(of: self.vm.isLaunchTime, perform: { value in
                                vm.updateLaunchTime(value)
                            })
                    }
                }
                .frame(height: 100)
                
                VStack{
                    HStack{
                        Text("Configure on Launch")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isConfigOnLaunchTime)
                            .onChange(of: self.vm.isConfigOnLaunchTime, perform: { value in
                                vm.updateConfigOnLaunch(value)
                            })
                    }
                }
                .frame(height: 30)
                
                VStack{
                    HStack{
                        Text("Add Delay")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isAddDelayKey)
                            .onChange(of: self.vm.isAddDelayKey, perform: { value in
                                vm.updateAddDelay(value)
                            })
                    }
                }
                .frame(height: 30)
                
                Spacer()
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
        //.alert(isPresented: $showConfirm, content: { confirmChange })
    }
    
    var confirmChange: Alert {
        Alert(title: Text("Change Configuration?"), message: Text("This application needs to restart to update the configuration. Do you want to restart the application?"),
              primaryButton: .default (Text("Yes")) {
            vm.applyChanges()
            showConfirm = true
        },
              secondaryButton: .cancel(Text("No"))
        )
    }
}

#Preview {
    ConfigurationView(isConfigurationActive: .constant(true), vm: ConfigurationModel())
}
