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
    
    var body: some View {
        HStack{
            VStack(spacing: 10) {
                
                VStack{
                    HStack{
                        Spacer()
                        Text("Configuration")
                            .font(Font.system(size: 18, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        Button("Done") {
                            isConfigurationActive = false
                        }
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Spacer()
                        Text("To owner the configuration changes, you must restart the app.")
                            .italic()
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("Default")
                            .font(Font.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                        Spacer()
                        
                        Toggle("", isOn: $vm.isConfigDefault)
                            .onChange(of: self.vm.isConfigDefault, perform: { value in
                                vm.updateDefaultConfig(value)
                            })
                    }
                }
                .frame(height: 50)
                
                VStack{
                    HStack{
                        Text("Screen Tracking")
                            .font(Font.system(size: 18, weight: .regular))
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
                        Text("ANR")
                            .font(Font.system(size: 18, weight: .regular))
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
                            .font(Font.system(size: 18, weight: .regular))
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
                        Text("Perfomance Monitor")
                            .font(Font.system(size: 18, weight: .regular))
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
                            .font(Font.system(size: 18, weight: .regular))
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
                        Text("Network Sample Rate")
                            .font(Font.system(size: 18, weight: .regular))
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
                        Text("Network State")
                            .font(Font.system(size: 18, weight: .regular))
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
                
                
               /* VStack{
                    HStack{
                        Spacer()
                        Button("Apply") {
                            vm.applyChanges()
                            exit(0)
                        }
                        Spacer()
                    }
                }
                .frame(height: 100)*/
  
                
                Spacer()
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    ConfigurationView(isConfigurationActive: .constant(true), vm: ConfigurationModel())
}
