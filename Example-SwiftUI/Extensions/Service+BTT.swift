//
//  Service+BTT.swift
//
//  Created by Mathew Gacy on 11/3/22.
//  Copyright © 2022 Blue Triangle. All rights reserved.
//

import Foundation
import Service

extension Service {
    static var captured: Self {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        let session = URLSession(configuration: config)
        return .init(
            baseURL: URL(string: "http://\(Secrets.baseURL)")!,
            networking: { request in
                try await ResponseValue(session.btData(for: request))
            })
    }
}
