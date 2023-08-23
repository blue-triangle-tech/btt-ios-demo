//
//  SettingsViewController.swift
//
//  Created by Admin on 22/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import BlueTriangle

class SettingsViewController: UIViewController {

    @IBOutlet weak var lblAppVersion: UILabel!
    @IBOutlet weak var lblSdkVersionRule: UILabel!
    @IBOutlet weak var lblSdkLocation: UILabel!
    @IBOutlet weak var lblSiteId: UILabel!
    @IBOutlet weak var lblSessionId: UILabel!
    
    @IBOutlet weak var lblAnrEnable : UILabel!
    @IBOutlet weak var lblScreenTrackEnable : UILabel!
    @IBOutlet weak var lblAnrStackTraceEnable : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblAnrEnable.text = UserDefaults.standard.bool(forKey: UserDefaultKeys.ANREnableKey) ? "Enable" : "Disable"
        lblScreenTrackEnable.text = UserDefaults.standard.bool(forKey: UserDefaultKeys.ScreenTrackingEnableKey)  ? "Enable" : "Disable"
        lblAnrStackTraceEnable.text = UserDefaults.standard.bool(forKey: UserDefaultKeys.ANRStackTraceKey) ? "Enable" : "Disable"
        lblSiteId.text = UserDefaults.standard.string(forKey: UserDefaultKeys.ConfigureSiteId) ?? ""
        lblAppVersion.text = "\(version())"
        lblSdkVersionRule.text = "feature/memory_warning_observer"//"master"
        lblSdkLocation.text = "http://github.com/JP-aloha/btt-swift-sdk.git"
        lblSessionId.text = UserDefaults.standard.string(forKey: UserDefaultKeys.ConfigureSessionId) ?? "Auto Generated"
        // Do any additional setup after loading the view.
        
        Thread.sleep(forTimeInterval: 3)
    }
    
    @IBAction func btnTestManualTimer(_ sender: UIButton) {
        let timer = BlueTriangle.startTimer(
            page: Page(
                pageName: "TEST MANUAL TIMER"))
        BlueTriangle.endTimer(timer)
    }
    
    func version() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version) (\(build))"
    }

}
