//
//  SettingsViewModel.swift
//
//  Created by Mathew Gacy on 10/27/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import Foundation

final class SettingsViewModel: ObservableObject {

    @Published var anrEnable : Bool = UserDefaults.standard.bool(forKey: UserDefaultKeys.ANREnableKey)
    @Published var screenTrackingEnable : Bool = UserDefaults.standard.bool(forKey: UserDefaultKeys.ScreenTrackingEnableKey)
    private(set) var configureSiteId : String = UserDefaults.standard.string(forKey: UserDefaultKeys.ConfigureSiteId) ?? ""
    
}
