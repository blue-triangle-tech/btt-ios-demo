//
//  ProductViewModel.swift
//
//  Created by Admin on 22/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation
import Service

class ProductViewModel {
    
    var product = [Product]()
    var eventHandler : ((_ event: Event ) -> Void)? // Data Binding Closure
    
    func fetchAPI() {
        self.eventHandler?(.loading)
        APIManager.shared.request { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let product):
                self.product = product
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
