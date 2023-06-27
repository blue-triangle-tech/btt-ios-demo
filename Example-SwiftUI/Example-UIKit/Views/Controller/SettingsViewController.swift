//
//  SettingsViewController.swift
//
//  Created by Admin on 22/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var lblAppVersion: UILabel!
    @IBOutlet weak var lblSdkVersionRule: UILabel!
    @IBOutlet weak var lblSdkLocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblAppVersion.text = "App Version : \(version())"
        lblSdkVersionRule.text = "master"
        lblSdkLocation.text = "http://github.com/JP-aloha/btt-swift-sdk.git"
        // Do any additional setup after loading the view.
    }
    
    func version() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version) (\(build))"
    }

}
