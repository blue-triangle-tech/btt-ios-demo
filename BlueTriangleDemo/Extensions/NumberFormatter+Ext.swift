//
//  NumberFormatter+Ext.swift
//  BlueTriangleDemo
//
//  Created by Mathew Gacy on 9/20/21.
//

import Foundation

extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }

    static var integer: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        return formatter
    }
}
