//
//  UnitTestsViewModel.swift
//
//  Created by Ashok Singh on 01/09/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation
import BlueTriangle

final class UnitTestsViewModel: ObservableObject {
    
    private var memmoryTest = MemoryAllocationTest()
    @Published var increasedMemoryInMb : Int64 = 0
    
    func initalTimer() {
        let timer = BlueTriangle.startTimer(
            page: Page(
                pageName: "INITIAL MEMORY TEST TIMER"))
        BlueTriangle.endTimer(timer)
    }
    
    func runMemoryTestsToIncrease100Mb() {
        memmoryTest.runMemoryTest()
        increasedMemoryInMb = increasedMemoryInMb + 100
    }
    
    func finalTimer() {
        let timer = BlueTriangle.startTimer(
            page: Page(
                pageName: "FINAL MEMORY TEST TIMER"))
        BlueTriangle.endTimer(timer)
    }
}
