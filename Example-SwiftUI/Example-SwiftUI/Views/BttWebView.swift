//
//  BttWebView.swift
//
//  Created by Ashok Singh on 18/01/24.
//  Copyright © 2024 Blue Triangle. All rights reserved.
//

import SwiftUI
import WebKit
import BlueTriangle

struct BttWebView: UIViewRepresentable {
   
    var tagUrl : String
    private let model = HybridViewModel()
    private let webView = WKWebView()
    
    func makeCoordinator() -> BttWebView.Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> some UIView {
        
        if let htmlURL = model.getTemplateUrl(tagUrl){
            webView.navigationDelegate = context.coordinator
            webView.load(URLRequest(url: htmlURL))
        }
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

extension BttWebView {
   
    class Coordinator: NSObject, WKNavigationDelegate {
   
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        }
        
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            BTTWebViewTracker.webView(webView, didCommit: navigation)
        }
    }
}
