//
//  SignalCrashViewController.swift
//
//  Created by Ashok Singh on 08/07/24.
//  Copyright © 2024 Blue Triangle. All rights reserved.
//

import UIKit

class SignalCrashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSelectDone(_ sender: Any?) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didSelectForcedOptionalCrash(_ sender : Any){
        NSLog("\(#fileID) \(#line)")
        var tmp : String?
        NSLog("%@", tmp!)
    }
    
    @IBAction func didSelectIndexOutOfBoundCrash(_ sender : Any){
        NSLog("\(#fileID) \(#line)")
        Task.detached {
            let list = [1, 2]
            NSLog("Values which not found", list[10])
        }
    }
    
    @IBAction func didSelectFatalError(_ sender : Any){
        NSLog("\(#fileID) \(#line)")
        fatalError("This is a fatal error")
    }
    
    @IBAction func didSelectUnsafeMemoryAccess(_ sender : Any){
        NSLog("\(#fileID) \(#line)")
        let pointer = UnsafeMutablePointer<Int>.allocate(capacity: 1)
        // Deallocate the memory
        pointer.deallocate()
        // Access the deallocated memory
        pointer.pointee = 42
    }
    
    @IBAction func didSelectDivideByZero(_ sender : Any){
        NSLog("\(#fileID) \(#line)")
        var op1 = "\(1)".count
        var op2 = op1 - 1
        var result = op1 / op2
        NSLog("Result : \(result)")
    }
    
    @IBAction func didSelectSegmentationFault(_ sender : Any){
        NSLog("\(#fileID) \(#line)")
        var pointer: UnsafeMutablePointer<Int>? = nil
        pointer!.pointee = 42  // This should cause a SIGSEGV
    }
}
