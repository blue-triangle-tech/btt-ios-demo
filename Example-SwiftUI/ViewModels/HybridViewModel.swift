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
    
    func getTemplateUrl(_ tagUrl : String) -> URL?{
      
        self.updateTempelate(tagUrl)
        
        guard let url = Bundle.main.url(forResource:"updated-template", withExtension: "html") else {
             return nil
        }
        
        return url
    }
    
    static func showDocInfo(){
        if let url = URL(string: "https://trackerdemo.github.io/hybrid-demo-info/") {
            UIApplication.shared.open(url)
        }
    }
    
    private func updateTempelate(_ tagUrl : String){
        guard let url = Bundle.main.url(forResource:"updated-template", withExtension: "html"), let tempData = getHTMLString(tagUrl)?.data(using: String.Encoding.utf8) else {
             return
        }
        
        do {
            try tempData.write(to: url, options: .atomic)
            print(url)
        } catch {
            print(error)
        }
    }
    
    private func getHTMLString(_ tagUrl : String) -> String?{
      
        guard let url = Bundle.main.url(forResource:"template", withExtension: "html") else {
             return nil
        }

        print(tagUrl)
        let replaceUrl = "<script type=\"text/javascript\" id=\"\" src=\"https://\(tagUrl)\"></script>"
        let htmlString = try? String(contentsOfFile: url.path, encoding: String.Encoding.utf8)
        let actualString = htmlString?.replacingOccurrences(of: "<!--- SCRIPT_TAG_GOES_HERE --->", with: replaceUrl)
        return actualString
    }
}


