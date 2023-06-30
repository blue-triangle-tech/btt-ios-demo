//
//  ANRTests.swift
//
//  Created by admin on 29/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation

struct ANRTest {
    
    static func crashTest() {
        
        let arr = NSArray()
        NSLog("\(arr[1])")
    }
    
    static func sleepMainThreadTest() {
        let interval : TimeInterval = 10
        Thread.sleep(forTimeInterval: interval)
    }
    
}
