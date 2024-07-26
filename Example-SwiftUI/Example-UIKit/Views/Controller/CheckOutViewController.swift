//
//  CheckOutViewController.swift
//
//  Created by Admin on 22/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
protocol CheckoutVCDelegate: AnyObject {
    func didCheckout(with id: String)
}
class CheckOutViewController: UIViewController {
    
    @IBOutlet weak var btnPlaceOrder: UIButton!
    @IBOutlet weak var itemPriceLbl: UILabel!
    @IBOutlet weak var itemCountLbl: UILabel!
    @IBOutlet weak var shippinghandlingPriceLbl: UILabel!
    @IBOutlet weak var estimatedtaxPriceLbl: UILabel!
    @IBOutlet weak var ordertotalPriceLbl: UILabel!
    
    weak var delegate: CheckoutVCDelegate?
    var vm: CheckoutViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtn()
        setupLbl()
    }
    
    private func setupBtn() {
        // AddToCart Button
        self.btnPlaceOrder.layer.cornerRadius = 10
    }
    
    private func setupLbl(){
        itemCountLbl.text = "Items (\(vm.itemCount))"
        self.itemPriceLbl.text = "$\(vm.itemTotal.roundedToPlaces())"
        self.shippinghandlingPriceLbl.text = "$\(vm.shipping.roundedToPlaces())"
        self.estimatedtaxPriceLbl.text = "$\(vm.estimatedTax.roundedToPlaces())"
        self.ordertotalPriceLbl.text = "$\(vm.total.roundedToPlaces())"
    }
    
    @IBAction func didClickPlaceOrder(_ sender: UIButton) {
        Task {
            await vm.placeOrder()
            self.dismiss(animated: true) { [self] in
                self.delegate?.didCheckout(with: self.vm.checkout.confirmation)
            }
        }
    }
}
