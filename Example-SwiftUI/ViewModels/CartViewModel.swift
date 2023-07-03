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
final class CartViewModel: ObservableObject {
    private let service: Service
    private let cartRepository: CartRepository
    @Published var checkoutItem: Checkout?
    @Published var productItems: IdentifiedArrayOf<CartItemModel> = []
    @Published var error: Error?
    @Published var checkoutitem: Checkout?
    @Published var isLoading: Bool = false
    
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
        guard let prodcut = productItems[id: id] else { return }
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
            let timer = BlueTriangle.startTimer(
                page: Page(
                    pageName: "Cart"))
            let checkout = try await cartRepository.checkout()
            self.checkoutItem = checkout
            let detail = try await cartRepository.confirm(checkout.id)

            BlueTriangle.endTimer(
                timer,
                purchaseConfirmation: PurchaseConfirmation(
                    cartValue: Decimal(checkout.items.reduce(into: 0) { result, item in
                        result += Double(item.price).flatMap { $0 * Double(item.quantity) } ?? 0
                    }),
                    orderNumber: detail.confirmation))
            cartRepository.deleteCart()
            isLoading = false
        } catch {
            self.error = error
        }
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
