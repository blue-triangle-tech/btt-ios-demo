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

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        loadWebView()
    }
    
    func loadWebView() {
        let url = URL(string: "https://bluetriangle.com/about")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    @IBAction func didSelectFinish(_ sender: Any?) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didSelectQuestion(_ sender: Any?) {
        if let url = URL(string: "https://developer.apple.com/documentation/safari-developer-tools/inspecting-ios") {
            UIApplication.shared.open(url)
        }
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
