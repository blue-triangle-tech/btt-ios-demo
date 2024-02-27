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
        
        guard let url = getHybridFile()?.url else {
             return nil
        }
        
        return url
    }
    
    static func showDocInfo(){
        if let url = URL(string: "https://trackerdemo.github.io/hybrid-demo-info/") {
            UIApplication.shared.open(url)
        }
    }
    
    func getHybridFile() -> HybridFile?{
        let baseURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        guard let containerUrl = baseURL?.appendingPathComponent("Hybrid") else { return nil }
        let fileName = "updated-template.html"
        let file = HybridFile(directory: containerUrl, name: fileName)
        return file
    }
    
    private func createPathAndUpdateTemplate(_ tagUrl : String){
        do {
            if let file = getHybridFile(), let tempData = getHTMLString(tagUrl)?.data(using: String.Encoding.utf8){
                if !FileManager.default.fileExists(atPath: file.url.absoluteString){
                    try FileManager.default.createDirectory(at: file.directory, withIntermediateDirectories: true)
                }
                try tempData.write(to: file.url, options: .atomic)
            }
        }
        catch {
            print(error)
        }
    }
    
    private func updateTempelate(_ tagUrl : String){
        self.createPathAndUpdateTemplate(tagUrl)
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

struct HybridFile {
    let directory: URL
    let name: String

    var url: URL {
        directory.appendingPathComponent(name)
    }

    var path: String {
        url.path
    }

    init(directory: URL, name: String) {
        self.directory = directory
        self.name = name
    }
}
