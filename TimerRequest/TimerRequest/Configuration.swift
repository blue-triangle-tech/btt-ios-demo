//
//  Configuration.swift
//  TimerRequest
//
//  Created by Mathew Gacy on 7/31/22.
//

import Foundation

enum Configuration {
    static var siteID: String {
        value(for: "_SITE_ID")
    }

    private static func value(for key: String) -> String {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            fatalError("Missing Configuration.Key: \(key)")
        }
        guard let value = object as? String else {
            fatalError("Invalid Type for Configuration.Key \(key)")
        }

        return value
    }
}
