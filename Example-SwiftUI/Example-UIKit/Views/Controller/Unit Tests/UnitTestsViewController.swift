//
//  UnitTestsViewController.swift
//
//  Created by Ashok Singh on 01/09/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class UnitTestsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension UnitTestsViewController: UITableViewDelegate, UITableViewDataSource{
      //  MARK: Tableview Delegate & DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.accessoryType = .disclosureIndicator
        
        if indexPath.row == 0{
            cell?.textLabel?.text = "Memory Test"
        }else{
            cell?.textLabel?.text = "CPU Test"
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        
        if indexPath.row == 0{
            guard let itemVC = storyboard.instantiateViewController(withIdentifier: "MemoryTestViewController") as? MemoryTestViewController else { return }
            self.navigationController?.pushViewController(itemVC, animated: true)
        }else{
            guard let itemVC = storyboard.instantiateViewController(withIdentifier: "CPUTestViewController") as? CPUTestViewController else { return }
            self.navigationController?.pushViewController(itemVC, animated: true)
        }
    }
}
