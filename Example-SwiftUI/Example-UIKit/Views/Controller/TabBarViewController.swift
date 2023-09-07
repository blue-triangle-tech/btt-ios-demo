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
        if let navVC = self.viewControllers?[0] as? UINavigationController, let productListVC = navVC.viewControllers[0] as? ProductViewController {
            productListVC.vm = ProductListViewModel(cartRepository: cartRepository, imageLoader: imageLoader, service: service)
        }
        
        if let navVC = self.viewControllers?[1] as? UINavigationController, let cartVC =  navVC.viewControllers[0] as? CartViewController {
            cartVC.vm = CartViewModel(service: service, cartRepository: cartRepository)
        }
        
    }
    
    
}
