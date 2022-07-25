//
//  TimerViewModel.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 7/24/22.
//

import Foundation

@MainActor
class TimerViewModel: ObservableObject {
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

    @Published var timerFields: [String: String]?

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
        let fields = BTTracker.shared()?.allGlobalFields()
        self.globalUserID = fields?["gID"] as? String ?? ""
        self.sessionID = fields?["sID"] as? String ?? ""
    }

    func submit() async {
        timerFields = await submitTimer(with: timerConfig)
    }

    func clear() {
        timerConfig = TimerConfiguration()
    }

    private func submitTimer(with configuration: TimerConfiguration) async -> [String: String]? {
        guard btTimer == nil else {
            return nil
        }

        let timer = BTTimer()
        timer.configure(with: timerConfig)

        btTimer = timer
        defer { btTimer = nil }

        timer.start()
        let task = Task { () -> [String: String]? in
            await Task.sleep(UInt64.random(in: 1_000_000_000...2_000_000_000))
            try Task.checkCancellation()

            let requestRepresentation = BTTracker.shared().allGlobalFields().merging(
                timer.allFields() ?? [:], uniquingKeysWith: { $1 }) as? [String: String]

            BTTracker.shared().submitTimer(timer)
            return requestRepresentation
        }

        do {
            return try await task.value
        } catch {
            return nil
        }
    }
}
