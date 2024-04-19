//
//  ConfigurationModel.swift
//
//  Created by Ashok Singh on 16/04/24.
//  Copyright © 2024 Blue Triangle. All rights reserved.
//

import Foundation
import Combine

struct ConfigUserDefaultKeys {
    static let ConfigDefaultKey = "ConfigDefaultKey"
    static let ConfigANRKey = "ConfigANRKey"
    static let ConfigScreenTrackingKey = "ConfigScreenTrackingKey"
    static let ConfigMemoryWarningKey = "ConfigMemoryWarningKey"
    static let ConfigPerfomanceMonitorKey = "ConfigPerfomanceMonitorKey"
   
    static let ConfigCrashKey = "ConfigCrashKey"
    static let ConfigNetworkSampleRateKey = "ConfigNetworkSampleRateKey"
    static let ConfigNetworkStateKey = "ConfigNetworkStateKey"
}

final class ConfigurationModel: ObservableObject {
        
    @Published var isConfigDefault : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigDefaultKey)
    @Published var isANR : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigANRKey)
    @Published var isScreenTracking : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigScreenTrackingKey)
    @Published var isMemoryWarning : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigMemoryWarningKey)
    @Published var isPerfomanceMonitor : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigPerfomanceMonitorKey)
    
    @Published var isCrashTracking : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigCrashKey)
    @Published var isNetworkSampleRate : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkSampleRateKey)
    @Published var isNetworkState : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkStateKey)
    
    init() {
        let isConfigDefaultKey = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigDefaultKey)
        let isScreenTrackingKey = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigScreenTrackingKey)
        let isAnrKey = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigANRKey)
        let isMemoryKey = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigMemoryWarningKey)
        let isPerfomanceKey = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigPerfomanceMonitorKey)
        
        let isCrashKey = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigCrashKey)
        let isNetworkSampleRateKey = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkSampleRateKey)
        let isNetworkState = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigNetworkStateKey)
        
        print("\(#function) - \(isConfigDefaultKey) - \(isScreenTrackingKey)  - \(isAnrKey)  - \(isMemoryKey)  - \(isPerfomanceKey)")
        
        self.isConfigDefault = isConfigDefaultKey
        self.isScreenTracking = isScreenTrackingKey
        self.isANR = isAnrKey
        self.isMemoryWarning = isMemoryKey
        self.isPerfomanceMonitor = isPerfomanceKey
        self.isCrashTracking = isCrashKey
        self.isNetworkSampleRate = isNetworkSampleRateKey
        self.isNetworkState = isNetworkState
    }
    
    func updateDefaultValue(){
        self.isScreenTracking = true
        self.isANR = true
        self.isMemoryWarning = true
        self.isPerfomanceMonitor = true
        self.isCrashTracking = true
        self.isNetworkSampleRate = false
        self.isNetworkState = false
        
        self.applyChanges()
    }
    
    func updateDefaultConfig(_ value : Bool){
        print("\(#function) - \(value)")
        self.isConfigDefault = value
        self.updateDefaultValue()
    }
    
    func updateANRConfig(_ value : Bool){
        print("\(#function) - \(value)")
        self.isANR = value
        self.applyChanges()
    }
    
    func updateScreenTrackingConfig(_ value : Bool){
        print("\(#function) - \(value)")
        self.isScreenTracking = value
        self.applyChanges()
    }
    
    func updateMemoryWarningConfig(_ value : Bool){
        print("\(#function) - \(value)")
        self.isMemoryWarning = value
        self.applyChanges()
    }
    
    func updatePerfomanceMonitorConfig(_ value : Bool){
        print("\(#function) - \(value)")
        self.isPerfomanceMonitor = value
        self.applyChanges()
    }
    
    func updateCrash(_ value : Bool){
        print("\(#function) - \(value)")
        self.isCrashTracking = value
        self.applyChanges()
    }
    
    func updateNetworkSampleRate(_ value : Bool){
        print("\(#function) - \(value)")
        self.isNetworkSampleRate = value
        self.applyChanges()
    }
    
    func updateNetworkState(_ value : Bool){
        print("\(#function) - \(value)")
        self.isNetworkState = value
        self.applyChanges()
    }
    
    func applyChanges(){
        UserDefaults.standard.setValue(isConfigDefault, forKey: ConfigUserDefaultKeys.ConfigDefaultKey)
        UserDefaults.standard.setValue(isANR, forKey: ConfigUserDefaultKeys.ConfigANRKey)
        UserDefaults.standard.setValue(isScreenTracking, forKey: ConfigUserDefaultKeys.ConfigScreenTrackingKey)
        UserDefaults.standard.setValue(isMemoryWarning, forKey: ConfigUserDefaultKeys.ConfigMemoryWarningKey)
        UserDefaults.standard.setValue(isPerfomanceMonitor, forKey: ConfigUserDefaultKeys.ConfigPerfomanceMonitorKey)
        
        UserDefaults.standard.setValue(isCrashTracking, forKey: ConfigUserDefaultKeys.ConfigCrashKey)
        UserDefaults.standard.setValue(isNetworkSampleRate, forKey: ConfigUserDefaultKeys.ConfigNetworkSampleRateKey)
        UserDefaults.standard.setValue(isNetworkState, forKey: ConfigUserDefaultKeys.ConfigNetworkStateKey)
        
        UserDefaults.standard.synchronize()
    }
}



