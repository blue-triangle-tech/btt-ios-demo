//
//  OrderSuccessfulViewController.swift
//
//  Created by admin on 30/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class OrderSuccessfulViewController: UIViewController {

    @IBOutlet weak var lblCheckoutId: UILabel!
    var checkoutID: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCheckoutId.text = checkoutID
    }

    @IBAction func didSelectContiueShopiing(_ sender: UIButton) {
        ANRTest.sleepMainThreadTest()
        self.navigationController?.popViewController(animated: true)
    }
}
