//
//  ProductDetailView.swift
//
//  Created by Admin on 21/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class ProductDetailView: UIViewController {
     
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQty: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var btnAddtoCart: UIButton!
    @IBOutlet weak var lblQty: UILabel!
    
    var vm: ProductDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBtn()
        setupLbl()
       
    }
    
    
    @IBAction func didClickStepper(_ sender: UIStepper) {
        self.vm.quantity = Int(sender.value)
        self.lblQty.text = "\(vm.quantity)"
    }
    
    private func setupLbl(){
        self.productTitle.text = vm.name
        self.productPrice.text = vm.price
        self.productDesc.text = vm.description
        Task {
            let imageStaus = await vm.imageStatus()
            switch imageStaus {
            case .downloaded(let result):
                switch result {
                case .success(let image):
                    self.productImage.image = image
                default:
                    self.productImage.image = UIImage(systemName: "exclamationmark.circle")
                }
            default:
                self.productImage.image = UIImage(systemName: "exclamationmark.circle")
            }
        }
    }
    
    private func setupBtn() {
        // AddToCart Button
        self.btnAddtoCart.layer.cornerRadius = 8
    }
    
    @IBAction func didSelectAddToCart(_ sender: Any) {
        vm.quantity += 1
        if vm.quantity > 3 {
                ANRTest.quantityLimitExceedCrash()
        }
        
        Task {
            btnAddtoCart.isEnabled = false
            await vm.addToCart()
            btnAddtoCart.isEnabled = true
        }
       
    }
}
