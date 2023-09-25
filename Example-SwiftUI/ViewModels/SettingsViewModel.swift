//
//  SettingsViewModel.swift
//
//  Created by Mathew Gacy on 10/27/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import Foundation

final class SettingsViewModel: ObservableObject {

    private(set) var anrEnable : Bool = UserDefaults.standard.bool(forKey: UserDefaultKeys.ANREnableKey)
    private(set) var screenTrackingEnable : Bool = UserDefaults.standard.bool(forKey: UserDefaultKeys.ScreenTrackingEnableKey)
    private(set) var anrStackTraceEnable : Bool = UserDefaults.standard.bool(forKey: UserDefaultKeys.ANRStackTraceKey)
    
    private(set) var configureSiteId : String = UserDefaults.standard.string(forKey: UserDefaultKeys.ConfigureSiteId) ?? ""
    private(set) var configureSessionId : String = UserDefaults.standard.string(forKey: UserDefaultKeys.ConfigureSessionId) ?? "Auto Generated"
    
}
