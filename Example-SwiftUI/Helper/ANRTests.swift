//
//  ANRTests.swift
//
//  Created by admin on 29/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation

struct ANRTest {
    
    static func quantityLimitExceedCrash() {
        
        // NSException Crash
        let arr = NSArray()
        NSLog("Not found element \(arr[1])")
    }
    
    static func cartLimitExceedCrash() {
        
        // Force Cast Crash
        let string: String = "TestString"
        let intValue = string as! Int
        NSLog("Force casted string value to int", intValue)
    }
    
    static func emptyCartCrash() {
        
        // Force Unwrap Crash
        var value: Int?
        NSLog("Force unwrapping nil value \(value!)")
    }
    
    static func removeCartItem(startTime: TimeInterval = Date().timeIntervalSince1970) {
        
        let diff = Date().timeIntervalSince1970 - startTime
        if diff <= 10 {
            Thread.sleep(forTimeInterval: 2)
            removeCartItem(startTime: startTime)
        }
    }
    
    static func heavyLoop(taskStartTime : Date = .now){
        
        let interval : TimeInterval = 8
        var list : [String] = []
        var generator = SystemRandomNumberGenerator()
        repeat{
            list.append("\(Int.random(in: 1...Int.max, using: &generator))")
            
            if Date().timeIntervalSince(taskStartTime) >= interval {return}
            
        }while(list.count < 20000)
        
        var duplicates = 0
        for number in list{
            
            var currentDuplicate = 0
            for n in list{
                if n == number{
                    currentDuplicate += 1
                }
                if Date().timeIntervalSince(taskStartTime) >= interval {return}
            }
            
            duplicates += (currentDuplicate - 1)
            if Date().timeIntervalSince(taskStartTime) >= interval {return}
        }
        
        if Date().timeIntervalSince(taskStartTime) < interval {
            heavyLoop(taskStartTime: taskStartTime)
        }
    }
    
}
