//
//  BTTConfigModel.swift
//
//  Created by Ashok Singh on 27/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation

import Foundation
import Combine
import BlueTriangle

class BTTConfigModel: ObservableObject {

    @Published var isConfiguration : Bool = true
    @Published var txtSiteId : String = ""
    
    
    func configure(){
        
        BlueTriangle.configure { config in
             config.siteID = txtSiteId
             config.networkSampleRate = 1.0
             config.enableScreenTracking = true
             config.enableDebugLogging = true
             config.ANRMonitoring = true
         }
        
        // BlueTriangle.metrics?["example-app"] = "custom1"
        
        isConfiguration = false
    }
    
}
