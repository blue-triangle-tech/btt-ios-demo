//
//  BttWebViewController.swift
//
//  Created by Ashok Singh on 22/12/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import WebKit
import BlueTriangle

class BttWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    private let model = HybridViewModel()
    var tagUrl : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadWebView()
    }
    
    func loadWebView() {
        
        guard let url = model.getTemplateUrl(tagUrl) else {
             return
        }
        webView.load(URLRequest(url: url))
       /* if let htmlString = model.getHTMLString(tagUrl){
           // webView.load(URLRequest(url: URL(string: "https://google.com")!))
            webView.loadHTMLString(htmlString, baseURL: nil)
        }*/
    }
    
    @IBAction func didSelectFinish(_ sender: Any?) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didSelectQuestion(_ sender: Any?) {
        HybridViewModel.showDocInfo()
    }
}

extension BttWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        let webTracker = BTTWebViewTracker()
        webTracker.webView(webView, didCommit: navigation)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print("Policy : \(navigationAction.request.url)")
        decisionHandler(.allow)
    }
}
