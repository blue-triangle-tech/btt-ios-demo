//
//  Identifier.swift
//
//  Created by admin on 12/09/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation
/// An 18-digit identifier.
public typealias Identifier = UInt64

extension Identifier {
    private static let minID: Self = 100_000_000_000_000_000
    private static let maxID: Self = 999_999_999_999_999_999

    static func random() -> Self {
        Self.random(in: minID ... maxID)
    }
}
