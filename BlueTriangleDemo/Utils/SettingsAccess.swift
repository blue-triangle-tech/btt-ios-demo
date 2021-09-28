//
//  SettingsAccess.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 8/31/21.
//

import Foundation

struct SettingsAccess {
    fileprivate static let appVersionKey = "app_version"

    private static var shortVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    private static var version: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }

    private static var commit: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CommitHash") as? String
    }

    static func initialize() {
        if let shortVersion = shortVersion,
           let version = version,
           let commit = commit {
            let trimmedCommit = commit[commit.index(commit.endIndex, offsetBy: -6)...]

            UserDefaults.standard.set("\(shortVersion)(\(version)) \(trimmedCommit)", forKey: appVersionKey)
        }
    }

    static var appVersionString: String? {
        return UserDefaults.standard.string(forKey: appVersionKey)
    }
}
