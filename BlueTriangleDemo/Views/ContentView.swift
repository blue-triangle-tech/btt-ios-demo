//
//  ContentView.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 8/31/21.
//

import SwiftUI
import BlueTriangleSDK_iOS

class ContentViewModel: ObservableObject {
    @Published var siteID: String {
        didSet {
            UserDefaults.standard.set(siteID, forKey: "siteID")
            BTTracker.shared().setSiteID(siteID)
        }
    }

    @Published var globalUserID: String {
        didSet { BTTracker.shared().setGlobalUserID(globalUserID) }
    }

    @Published var sessionID: String {
        didSet { BTTracker.shared().setSessionID(sessionID) }
    }

    @Published var timerConfig = TimerConfiguration()
    private var timerDelay: Double {
        Double.random(in: 1...2)
    }

    @Published var showDetail = false
    var timerFields: [String: String]?
    private var btTimer: BTTimer?

    init() {
        self.siteID = UserDefaults.standard.string(forKey: "siteID") ?? Constants.siteID
        let fields = BTTracker.shared()?.allGlobalFields()
        self.globalUserID = fields?["gID"] as? String ?? ""
        self.sessionID = fields?["sID"] as? String ?? ""
    }

    func submit() {
        let timer = BTTimer()
        timer.configure(with: timerConfig)
        timer.start()
        submitTimer(timer: timer, after: timerDelay)
    }

    func clear() {
        timerConfig = TimerConfiguration()
    }

    func submitTimer(timer: BTTimer, after delay: Double) {
        guard self.btTimer == nil else {
            return
        }
        self.btTimer = timer
        DispatchQueue.main.schedule(after: .init(.now() + delay)) { [weak self] in
            let requestRepresentation = BTTracker.shared().allGlobalFields().merging(
                timer.allFields() ?? [:], uniquingKeysWith: { $1 }) as? [String: String]

            BTTracker.shared().submitTimer(timer)
            self?.btTimer = nil

            if requestRepresentation != nil {
                self?.timerFields = requestRepresentation
                self?.showDetail = true
            }
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel

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
                        viewModel.submit()
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "arrow.up.circle.fill")
                            Text("Submit")
                        }
                    }

                    Spacer()

                    Button("Clear") {
                        viewModel.clear()
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showDetail, onDismiss: { viewModel.timerFields = nil}) {
            TimerRequestView(shouldDisplay: $viewModel.showDetail, timerFields: viewModel.timerFields ?? [:])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
