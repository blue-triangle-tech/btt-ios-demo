//
//  TimerViewModel.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 7/24/22.
//

import BlueTriangle
import Foundation

@MainActor
class TimerViewModel: ObservableObject {
    let siteID: String
    let globalUserID: String

    @Published var isReturningVisitor: Bool {
        didSet {
            BlueTriangle.isReturningVisitor = isReturningVisitor
        }
    }

    @Published var sessionID: String {
        didSet {
            BlueTriangle.sessionID = UInt64(sessionID) ?? 0
        }
    }

    @Published var abTestID: String {
        didSet {
            BlueTriangle.abTestID = abTestID
        }
    }

    @Published var campaignMedium: String {
        didSet {
            BlueTriangle.campaignMedium = campaignMedium
        }
    }

    @Published var campaignName: String {
        didSet {
            BlueTriangle.campaignName = campaignName
        }
    }

    @Published var campaignSource: String {
        didSet {
            BlueTriangle.campaignSource = campaignSource
        }
    }

    @Published var dataCenter: String {
        didSet {
            BlueTriangle.dataCenter = dataCenter
        }
    }

    @Published var trafficSegmentName: String {
        didSet {
            BlueTriangle.trafficSegmentName = trafficSegmentName
        }
    }

    @Published var timerFields: [String: String]?

    @Published var page = Page(pageName: "")

    @Published var showPurchaseConfirmation: Bool = false

    @Published var purchaseConfirmation = PurchaseConfirmation(cartValue: 0.0)

    var hasPendingTimer: Bool {
        btTimer != nil
    }

    private var btTimer: BTTimer? {
        didSet {
            objectWillChange.send()
        }
    }

    init() {
        self.siteID = UserDefaults.standard.string(forKey: "siteID") ?? Constants.siteID
        self.globalUserID = String(BlueTriangle.globalUserID)
        self.isReturningVisitor = BlueTriangle.isReturningVisitor
        self.sessionID = String(BlueTriangle.sessionID)
        self.abTestID = BlueTriangle.abTestID
        self.campaignMedium = BlueTriangle.campaignMedium
        self.campaignName = BlueTriangle.campaignName
        self.campaignSource = BlueTriangle.campaignSource
        self.dataCenter = BlueTriangle.dataCenter
        self.trafficSegmentName = BlueTriangle.trafficSegmentName
    }

    func submit() async {
        timerFields = await submitTimer()
    }

    func clear() {
        page = Page(pageName: "")
    }

    private func submitTimer() async -> [String: String]? {
        guard btTimer == nil else {
            return nil
        }

        let timer = BlueTriangle.makeTimer(page: page)

        btTimer = timer
        defer { btTimer = nil }

        timer.start()
        let task = Task { () -> [String: String]? in
            try await Task.sleep(nanoseconds: UInt64.random(in: 1_000_000_000...2_000_000_000))
            try Task.checkCancellation()

            let requestRepresentation: [String: String] = [:]

            BlueTriangle.endTimer(
                timer,
                purchaseConfirmation: showPurchaseConfirmation ? purchaseConfirmation : nil)
            return requestRepresentation
        }

        do {
            return try await task.value
        } catch {
            return nil
        }
    }
}
