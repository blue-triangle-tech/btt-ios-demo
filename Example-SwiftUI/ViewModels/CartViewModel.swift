//
//  CartViewModel.swift
//
//  Created by Mathew Gacy on 10/27/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import Foundation
import IdentifiedCollections
import Service
import BlueTriangle
import UIKit

final class CartViewModel: ObservableObject {
    private let service: Service
    private let cartRepository: CartRepository
    @Published var checkoutItem: Checkout?
    @Published var productItems: IdentifiedArrayOf<CartItemModel> = []
    @Published var error: Error?
    @Published var checkoutitem: Checkout?
    @Published var isLoading: Bool = false
    @Published var isMemoryWarning: Bool = false
    
    var estimatedTax: Double {
        Constants.averageSalesTax * subtotal
    }

    var subtotal: Double {
        productItems.reduce(into: 0) { result, item in
            result += item.price
        }
    }

    init(service: Service, cartRepository: CartRepository) {
        self.service = service
        self.cartRepository = cartRepository

        cartRepository.items
            .receive(on: DispatchQueue.main)
            .assign(to: &$productItems)
    }

    @MainActor
    func checkout() async {
        do {
            isLoading = true
            checkoutItem = try await cartRepository.checkout()
            isLoading = false
        } catch {
            self.error = error
        }
    }

    @MainActor
    func increment(id: CartItemModel.ID) async {
        guard let currentQuantity = productItems[id: id]?.quantity else {
            return
        }

        do {
            isLoading = true
            try await cartRepository.updateQuantity(cartItemID: id, quantity: currentQuantity + 1)
            isLoading = false
        } catch {
            self.error = error
        }
    }

    @MainActor
    func decrement(id: CartItemModel.ID) async {
        guard let currentQuantity = productItems[id: id]?.quantity else {
            return
        }

        do {
            if currentQuantity > 1 {
                isLoading = true
                try await cartRepository.updateQuantity(cartItemID: id, quantity: currentQuantity - 1)
                isLoading = false
            } else {
                isLoading = true
                try await cartRepository.remove(cartItemID: id)
                isLoading = false
            }
        } catch {
            self.error = error
        }
    }
    
    @MainActor
    func removeProduct(id: CartItemModel.ID) async {
        guard let product = productItems[id: id] else { return }
        do {
            isLoading = true
            try await cartRepository.remove(cartItemID: id)
            isLoading = false
        } catch {
            self.error = error
        }
    }
    
    @MainActor
    func placeOrder() async {
        do {
            isLoading = true
            var timer : BTTimer?
            if BlueTriangle.initialized {
                timer = BlueTriangle.startTimer(
                    page: Page(
                        pageName: "Confirmation"))
            }
            let checkout = try await cartRepository.checkout()
            self.checkoutItem = checkout
            let detail = try await cartRepository.confirm(checkout.id)
            let cartValue = Decimal(checkout.items.reduce(into: 0) { result, item in
                result += Double(item.price).flatMap { $0 * Double(item.quantity) } ?? 0
            })
            let cartCount = checkout.items.reduce(into: 0) { result, item in
                result +=  item.quantity
            }

            if let timer = timer, BlueTriangle.initialized {
                BlueTriangle.endTimer(
                    timer,
                    purchaseConfirmation: PurchaseConfirmation(
                        cartValue: cartValue,
                        cartCount: cartCount,
                        cartCountCheckout:cartCount,
                        orderNumber: detail.confirmation))
            }
            cartRepository.deleteCart()
            isLoading = false
        } catch {
            self.error = error
        }
    }
    
    deinit {
        removeObserver()
    }
}

extension CartViewModel {
    func checkoutViewModel(_ checkout: Checkout) -> CheckoutViewModel {
        CheckoutViewModel(
            cartRepository: cartRepository,
            checkout: checkout,
            onFinish: { [weak self] in
                self?.checkoutItem = nil
            })
    }
}

extension CartViewModel {
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
