//
//  TimerView.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 8/31/21.
//

import BlueTriangle
import SwiftUI

struct TimerView: View {
    @StateObject var viewModel: TimerViewModel
    @State var showDetail = false

    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("Session (1)"),
                    footer: Text("Can only be set during initial configuration")
                ) {
                    LabeledView("Site ID") {
                        Text(viewModel.siteID)
                            .foregroundColor(.gray)
                    }
                    LabeledView("Global User ID") {
                        Text(viewModel.globalUserID)
                            .foregroundColor(.gray)
                    }
                }

                Section(header: Text("Session")) {
                    Toggle("Returning Visitor", isOn: $viewModel.isReturningVisitor)
                    LabeledView("Session ID") {
                        TextField("", text: $viewModel.sessionID)
                            .keyboardType(.numbersAndPunctuation)
                            .disabled(true)
                    }
                    LabeledView("A/B Test ID") {
                        TextField("", text: $viewModel.abTestID)
                    }
                    LabeledView("Campaign Medium") {
                        TextField("", text: $viewModel.campaignMedium)
                    }
                    LabeledView("Campaign Name") {
                        TextField("", text: $viewModel.campaignName)
                    }
                    LabeledView("Campaign Source") {
                        TextField("", text: $viewModel.campaignSource)
                    }
                    LabeledView("Data Center") {
                        TextField("", text: $viewModel.dataCenter)
                    }
                    LabeledView("Traffic Segment Name") {
                        TextField("", text: $viewModel.trafficSegmentName)
                    }
                }

                Section(header: Text("Page")) {
                    LabeledView("Page Name") {
                        TextField("", text: $viewModel.page.pageName)
                    }
                    LabeledView("Page Type") {
                        TextField("", text: $viewModel.page.pageType)
                    }
                    LabeledView("Brand Value") {
                        TextField("", value: $viewModel.timerConfig.brandValue, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    LabeledView("Referring URL") {
                        TextField("", text: $viewModel.page.referringURL)
                    }
                    LabeledView("URL") {
                        TextField("", text: $viewModel.timerConfig.url)
                    }
                }

                Section(
                    header: HStack {
                        Button {
                            viewModel.showPurchaseConfirmation.toggle()
                        } label: {
                            HStack {
                                Text("PURCHASE CONFIRMATION")
                                Spacer()
                                Image(systemName: "chevron.right.circle")
                                    .rotationEffect(.degrees(viewModel.showPurchaseConfirmation ? 90.0 : 0.0))
                                    .animation(.default, value: viewModel.showPurchaseConfirmation)
                            }
                        }
                    }
                ) {
                    if viewModel.showPurchaseConfirmation {
                        LabeledView("Cart Value") {
                            TextField(
                                "",
                                value: $viewModel.purchaseConfirmation.cartValue,
                                formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                        }
                        LabeledView("Order Numer") {
                            TextField(
                                "",
                                text: $viewModel.purchaseConfirmation.orderNumber)
                        }
                        LabeledView("Order Time") {
                            TextField(
                                "",
                                value: $viewModel.purchaseConfirmation.orderTime,
                                formatter: NumberFormatter.integer)
                            .keyboardType(.numbersAndPunctuation)
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
            .navigationBarTitle("Timer", displayMode: .automatic)
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        Task {
                            await viewModel.submit()
                            if viewModel.timerFields != nil {
                                showDetail = true
                            }
                        }
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "arrow.up.circle.fill")
                            Text("Submit")
                        }
                    }
                    .disabled(viewModel.hasPendingTimer)

                    Spacer()

                    Button("Clear") {
                        viewModel.clear()
                    }
                }
            }
        }
        .sheet(isPresented: $showDetail, onDismiss: { viewModel.timerFields = nil}) {
            TimerRequestView(shouldDisplay: $showDetail, timerFields: viewModel.timerFields ?? [:])
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewModel: .init())
    }
}
