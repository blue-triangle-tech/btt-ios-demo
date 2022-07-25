//
//  ContentView.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 8/31/21.
//

import SwiftUI
import BlueTriangleSDK_iOS

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    @State var showDetail = false

    var body: some View {
        NavigationView {
            Form {

                Section(header: Text("GLOBAL")) {
                    LabeledView("Site ID") {
                        TextField("", text: $viewModel.siteID)
                    }
                    LabeledView("Session ID") {
                        TextField("", text: $viewModel.sessionID)
                    }
                    LabeledView("Global User ID") {
                        TextField("", text: $viewModel.globalUserID)
                    }
                }

                Section(header: Text("TIMER: A")) {
                    LabeledView("Page Name") {
                        TextField("", text: $viewModel.timerConfig.pageName)
                    }
                    LabeledView("Traffic Segment Name") {
                        TextField("", text: $viewModel.timerConfig.trafficSegmentName)
                    }
                    LabeledView("A/B Test ID") {
                        TextField("", text: $viewModel.timerConfig.abTestID)
                    }
                    LabeledView("Content Group Name") {
                        TextField("", text: $viewModel.timerConfig.contentGroupName)
                    }
                    LabeledView("URL") {
                        TextField("", text: $viewModel.timerConfig.url)
                    }
                    LabeledView("Referrer") {
                        TextField("", text: $viewModel.timerConfig.referrer)
                    }
                }

                Section(header: Text("CAMPAIGN")) {
                    LabeledView("Campaign Name") {
                        TextField("", text: $viewModel.timerConfig.campaignName)
                    }
                    LabeledView("Campaign Source") {
                        TextField("", text: $viewModel.timerConfig.campaignSource)
                    }
                    LabeledView("Campaign Medium") {
                        TextField("", text: $viewModel.timerConfig.campaignMedium)
                    }
                }

                Section(header: Text("TIMER: B")) {
                    LabeledView("Brand Value") {
                        TextField("", value: $viewModel.timerConfig.brandValue, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    LabeledView("Page Value") {
                        TextField("", value: $viewModel.timerConfig.pageValue, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    LabeledView("Cart Value") {
                        TextField("", value: $viewModel.timerConfig.cartValue, formatter: NumberFormatter.decimal)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    LabeledView("Order Numer") {
                        TextField("", text: $viewModel.timerConfig.orderNumber)
                    }
                    LabeledView("Order Time") {
                        TextField("", value: $viewModel.timerConfig.orderTime, formatter: NumberFormatter.integer)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    LabeledView("Time on Page") {
                        TextField("", value: $viewModel.timerConfig.timeOnPage, formatter: NumberFormatter.integer)
                            .keyboardType(.numbersAndPunctuation)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
