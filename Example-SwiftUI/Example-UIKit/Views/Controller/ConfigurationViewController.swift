//
//  ConfigurationViewController.swift
//
//  Created by Ashok Singh on 15/04/24.
//  Copyright © 2024 Blue Triangle. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {

    @IBOutlet var switchDefault : UISwitch!
    @IBOutlet var switchScreenTracking : UISwitch!
    @IBOutlet var switchANR : UISwitch!
    @IBOutlet var switchMemoryWorning : UISwitch!
    @IBOutlet var switchNetworkMonitor : UISwitch!
    @IBOutlet var switchCrash : UISwitch!
    @IBOutlet var switchNetworkSampleRate : UISwitch!
    @IBOutlet var switchNetworkState : UISwitch!
    
    private let vm =  ConfigurationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadConfiguration()
    }
    
    func loadConfiguration(){
        switchDefault.isOn = vm.isConfigDefault
        switchScreenTracking.isOn = vm.isScreenTracking
        switchANR.isOn = vm.isANR
        switchMemoryWorning.isOn = vm.isMemoryWarning
        switchNetworkMonitor.isOn = vm.isPerfomanceMonitor
        switchCrash.isOn = vm.isCrashTracking
        switchNetworkSampleRate.isOn = vm.isNetworkSampleRate
        switchNetworkState.isOn = vm.isNetworkState
        
        switchScreenTracking.isEnabled = !vm.isConfigDefault
        switchANR.isEnabled = !vm.isConfigDefault
        switchMemoryWorning.isEnabled = !vm.isConfigDefault
        switchNetworkMonitor.isEnabled = !vm.isConfigDefault
        switchCrash.isEnabled = !vm.isConfigDefault
        switchNetworkSampleRate.isEnabled = !vm.isConfigDefault
        switchNetworkState.isEnabled = !vm.isConfigDefault
    }
    
    @IBAction func didSelectDone(_ sender: Any?) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didSelectApply(_ sender: Any?) {
        vm.applyChanges()
    }
    
    @IBAction func didChangeSwitch(_ sender: UISwitch?) {
        
        if let sender = sender{
            if sender == switchDefault{
                vm.updateDefaultConfig(sender.isOn)
                self.loadConfiguration()
            }else if  sender == switchScreenTracking{
                vm.updateScreenTrackingConfig(sender.isOn)
            }else if  sender == switchANR{
                vm.updateANRConfig(sender.isOn)
            }else if  sender == switchMemoryWorning{
                vm.updateMemoryWarningConfig(sender.isOn)
            }else if  sender == switchNetworkMonitor{
                vm.updatePerfomanceMonitorConfig(sender.isOn)
            }else if  sender == switchCrash{
                vm.updateCrash(sender.isOn)
            }else if  sender == switchNetworkSampleRate{
                vm.updateNetworkSampleRate(sender.isOn)
            }else if  sender == switchNetworkState{
                vm.updateNetworkState(sender.isOn)
            }
        }
    }
}
