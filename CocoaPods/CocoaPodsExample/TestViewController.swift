//
//  TestViewController.swift
//  CocoaPodsExample
//
//  Created by Ashok Singh on 31/07/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Thread.sleep(forTimeInterval: 2)
    }
    
    @IBAction func didSelectDissmiss(_ sender : Any){
        self.dismiss(animated: true)
    }
}
