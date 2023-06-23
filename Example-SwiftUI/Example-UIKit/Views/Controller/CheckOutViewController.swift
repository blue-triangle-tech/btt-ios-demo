//
//  CheckOutViewController.swift
//
//  Created by Admin on 22/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController {
    
    @IBOutlet weak var btnPlaceOrder: UIButton!
    @IBOutlet weak var itemPriceLbl: UILabel!
    @IBOutlet weak var shippinghandlingPriceLbl: UILabel!
    @IBOutlet weak var estimatedtaxPriceLbl: UILabel!
    @IBOutlet weak var ordertotalPriceLbl: UILabel!
    
    var strItemPrice: String?
    var strshippinghandlingPrice: String?
    var strestimatedtaxPrice: String?
    var strordertotalPrice: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtn()
        setupLbl()
        // Do any additional setup after loading the view.
    }
    
    private func setupBtn() {
        // AddToCart Button
        self.btnPlaceOrder.layer.cornerRadius = 10
    }
    
    private func setupLbl(){
        self.itemPriceLbl.text = strItemPrice
        self.shippinghandlingPriceLbl.text = strshippinghandlingPrice
        self.estimatedtaxPriceLbl.text = strestimatedtaxPrice
        self.ordertotalPriceLbl.text = strordertotalPrice
    }
    
    

}
