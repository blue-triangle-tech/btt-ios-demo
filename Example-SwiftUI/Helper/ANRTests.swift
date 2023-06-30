//
//  ANRTests.swift
//
//  Created by admin on 29/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation

struct ANRTest {
    
    static func quantityLimitExceedCrash() {
        fatalError("Quantity of a product can not be more than 3.")
    }
    
    static func cartLimitExceedCrash() {
        fatalError("Can not add more than 4 product in cart.")
    }
    
    static func sleepMainThreadTest() {
        let interval : TimeInterval = 10
        Thread.sleep(forTimeInterval: interval)
    }
    
}
