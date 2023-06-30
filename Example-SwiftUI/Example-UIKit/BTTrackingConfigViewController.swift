//
//  BTTrackingConfigViewController.swift
//
//  Created by Ashok Singh on 27/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import BlueTriangle

class BTTrackingConfigViewController: UIViewController {

    @IBOutlet weak var txtSiteID : UITextField!
    @IBOutlet weak var anrEnableSwitch : UISwitch!
    @IBOutlet weak var screenTrackEnableSwitch : UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtSiteID.text = ""
    }
    
    @IBAction func didSelectConfig(_ sender: Any?) {
        
        guard let siteId = self.txtSiteID.text?.trimmingCharacters(in: .whitespaces), siteId.count > 0 else{
            return
        }
        
        UserDefaults.standard.set(anrEnableSwitch.isOn, forKey: UserDefaultKeys.ANREnableKey)
        UserDefaults.standard.set(screenTrackEnableSwitch.isOn, forKey: UserDefaultKeys.ScreenTrackingEnableKey)
        UserDefaults.standard.set(siteId, forKey: UserDefaultKeys.ConfigureSiteId)
        UserDefaults.standard.synchronize()
        
        BlueTriangle.configure { config in
            config.siteID = siteId
            config.networkSampleRate = 1.0
            config.enableDebugLogging = true
            config.enableScreenTracking = screenTrackEnableSwitch.isOn
            config.ANRMonitoring = anrEnableSwitch.isOn
        }
        
        AppCoordinator.setupRootTabVc()
    }
    
    @IBAction func didChangeANRSwitch(_ sender: Any?) {
    }
    
    @IBAction func didChangeScreenTrackSwitch(_ sender: Any?) {
    }
}
