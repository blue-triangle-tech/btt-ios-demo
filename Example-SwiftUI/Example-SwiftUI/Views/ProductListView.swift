//
//  ProductListView.swift
//
//  Created by Mathew Gacy on 10/27/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import Service
import SwiftUI
import BlueTriangle

struct ProductListView: View {
    enum Route: Hashable {
        case productDetail(Product)
    }

    @ObservedObject var viewModel: ProductListViewModel
    @State var  timer : BTTimer?

    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
    }

    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 150, maximum: 170))]
    }

    var body: some View {
        NavigationStack {
            VStack{
                ScrollView {
                    HStack(alignment: .top, spacing: 16) {
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.products.0) { product in
                                NavigationLink(value: product) {
                                    ProductCell(
                                        imageStatusProvider: viewModel.imageStatus(_:),
                                        product: product)
                                }
                            }
                        }
                        
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.products.1) { product in
                                NavigationLink(value: product) {
                                    ProductCell(
                                        imageStatusProvider: viewModel.imageStatus(_:),
                                        product: product)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .navigationDestination(for: Product.self) { product in
                        if let detailViewModel = viewModel.detailViewModel(for: product.id) {
                            ProductDetailView(
                                viewModel: detailViewModel)
                        } else {
                            Text("Error")
                        }
                    }
                }
                .bttTrackScreen("ProductListView")
                .onAppear{
                    let isScreenTracking : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigScreenTrackingKey)
                    if !isScreenTracking, BlueTriangle.initialized{
                        self.timer = BlueTriangle.startTimer(
                            page: Page(
                                pageName: "ProductListView Mannual Tracking"))
                    }
                }
                .onDisappear {
                    let isScreenTracking : Bool = UserDefaults.standard.bool(forKey: ConfigUserDefaultKeys.ConfigScreenTrackingKey)
                    if let timer = self.timer, !isScreenTracking, BlueTriangle.initialized{
                        BlueTriangle.endTimer(timer)
                    }
                }
                .refreshable {
                    await viewModel.loadProducts()
                }
                .task {
                    await viewModel.onAppear()
                }
                .navigationTitle("Products")
                
                HStack{
                    Text("SessionID :")
                        .font(Font.system(size: 16, weight: .medium))
                    Text("\(viewModel.configureSessionId)")
                        .font(Font.system(size: 16, weight: .regular))
                        .accessibilityIdentifier("sessionid")
                }
                .padding(.bottom, 10)
                .frame(height: 20)
            }
        }
        .errorAlert(error: $viewModel.error)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(
            viewModel: .init(
                cartRepository: .mock,
                imageLoader: .mock,
                service: .mock))
    }
}
