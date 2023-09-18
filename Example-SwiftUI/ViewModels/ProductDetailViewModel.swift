//
//  ProductDetailViewModel.swift
//
//  Created by Mathew Gacy on 10/27/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import BlueTriangle
import Foundation
import Service
import UIKit

final class ProductDetailViewModel: ObservableObject {
    @Published var error: Error?
    @Published var quantity: Int
    private let cartRepository: CartRepository
    private let imageLoader: ImageLoader
    private let product: Product
    @Published var isMemoryWarning: Bool = false

    var name: String {
        product.name
    }

    var description: String {
        product.description
    }

    var price: String {
        "$\(product.price)"
    }

    init(
        cartRepository: CartRepository,
        imageLoader: ImageLoader,
        product: Product, quantity: Int = 0
    ) {
        self.cartRepository = cartRepository
        self.imageLoader = imageLoader
        self.product = product
        self.quantity = quantity
    }

    @MainActor
    func imageStatus() async -> ImageStatus? {

        
        // Start timer
        let timer = BlueTriangle.startTimer(
            page: Page(
                pageName: "ProductDetail: \(product.name)"))

        let status = await imageLoader.images[product.image]

        // End timer
        BlueTriangle.endTimer(timer)

        return status
    }

    @MainActor
    func addToCart() async {
        
        do {
            try  await cartRepository.add(
                product: product,
                quantity: quantity)
        } catch {
            self.error = error
        }
        
        if product.name.lowercased().contains("perfume"){
            cartRepository.increase100MbMemory()
        }
        
        if product.name.lowercased().contains("key holder"){
            cartRepository.cpuUses50To80Percent()
        }
        
        if product.name.lowercased().contains("infinix inbook"){
            cartRepository.cpuUsesSingleCore100Percent()
        }
        
        if product.name.lowercased().contains("oppof19"){
            cartRepository.cpuUsesDoubleCore100Percent()
        }
    }
    
    deinit {
        removeObserver()
    }
}

extension ProductDetailViewModel {
    //MARK: - Memory Warning observers
   
   @objc func raiseMemoryWarning(){
       self.isMemoryWarning = true
   }
    
    private func resisterObserver(){
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(raiseMemoryWarning),
                                               name: UIApplication.didReceiveMemoryWarningNotification,
                                               object: nil)
    }
    
    private func removeObserver(){
        NotificationCenter.default.removeObserver(self,
                                                          name: UIApplication.didReceiveMemoryWarningNotification,
                                                          object: nil)
    }
}
