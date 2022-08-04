//
//  Bool+Utils.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 7/24/22.
//

import Foundation

extension Bool {
    var smallInt: Int {
        self ? 1 : 0
    }

    var smallIntString: String {
        self ? "1" : "0"
    }
}
