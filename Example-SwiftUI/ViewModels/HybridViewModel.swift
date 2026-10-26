//
//  HybridViewModel.swift
//
//  Created by Ashok Singh on 18/01/24.
//  Copyright © 2024 Blue Triangle. All rights reserved.
//

import Foundation
import UIKit
//Hybrid demo


final class HybridViewModel: ObservableObject {
    
    func webviewSiteURL() -> String{
            return "https://ganesh-aloha.github.io/sdk_demo_page/index.html?redirectToHome=true&siteId=" + Secrets.siteID
        }
    
    static func showDocInfo(){
        if let url = URL(string: "https://trackerdemo.github.io/hybrid-demo-info/") {
            UIApplication.shared.open(url)
        }
    }
}
