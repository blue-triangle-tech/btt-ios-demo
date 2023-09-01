//
//  MemoryTestViewController.swift
//
//  Created by Ashok Singh on 01/09/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import BlueTriangle

class MemoryTestViewController: UIViewController {
    
    private var unitTestModel = UnitTestsViewModel()
    @IBOutlet weak var lblIncreasedMemory: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    private func updateUI(){
        lblIncreasedMemory.text = "\(unitTestModel.increasedMemoryInMb) MB memory manually increased"
    }
    
    @IBAction func didRunTestCase(_ sender: Any) {
        unitTestModel.runMemoryTestsToIncrease100Mb()
        self.updateUI()
    }
    
    @IBAction func didInitialTimer(_ sender: Any) {
        unitTestModel.initalTimer()
    }
    
    @IBAction func didFinalTimer(_ sender: Any) {
        unitTestModel.finalTimer()
    }
}
