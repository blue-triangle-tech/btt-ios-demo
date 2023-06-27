//
//  TabBarViewController.swift
//
//  Created by admin on 27/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import Service

class TabBarViewController: UITabBarController {

    let service = Service.captured
    let imageLoader = ImageLoader.live
    var cartRepository: CartRepository!
    override func viewDidLoad() {
        super.viewDidLoad()
        cartRepository = CartRepository(service: service)
        if let productListVC = self.viewControllers?[0] as? ProductViewController {
            productListVC.vm = ProductListViewModel(cartRepository: cartRepository, imageLoader: imageLoader, service: service)
        }
        
        if let cartVC =  self.viewControllers?[1] as? CartViewController {
            cartVC.vm = CartViewModel(service: service, cartRepository: cartRepository)
        }
        
    }
    
    
}
