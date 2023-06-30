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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtSiteID.text = ""
    }
    
    @IBAction func didSelectConfig(_ sender: Any?) {
        
        guard let siteId = self.txtSiteID.text?.trimmingCharacters(in: .whitespaces), siteId.count > 0 else{
            return
        }
        
        BlueTriangle.configure { config in
             config.siteID = siteId
             config.networkSampleRate = 1.0
             config.enableScreenTracking = true
             config.enableDebugLogging = true
             config.ANRMonitoring = true
         }
        
        AppCoordinator.setupRootTabVc()
    }
}
