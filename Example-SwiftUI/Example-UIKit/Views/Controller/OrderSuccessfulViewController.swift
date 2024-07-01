//
//  OrderSuccessfulViewController.swift
//
//  Created by admin on 30/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class OrderSuccessfulViewController: UIViewController {

    @IBOutlet weak var lblCheckoutId: UILabel!
    @IBOutlet weak var btnConitueShopping: UIButton!
    
    var checkoutID: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblCheckoutId.text = checkoutID
        btnSetup()
        
        let backButton = UIBarButtonItem()
        backButton.title = "Cart"
        navigationItem.backBarButtonItem = backButton
        self.navigationItem.leftBarButtonItem?.accessibilityIdentifier = "Back"
        
        btnConitueShopping.accessibilityIdentifier = "Conitue Shopping"
    }

    @IBAction func didSelectContiueShopiing(_ sender: UIButton) {
        ANRTest.heavyLoop()
        self.navigationController?.popViewController(animated: true)
    }
    
    func btnSetup() {
        self.btnConitueShopping.layer.cornerRadius = 8
       
    }

}
