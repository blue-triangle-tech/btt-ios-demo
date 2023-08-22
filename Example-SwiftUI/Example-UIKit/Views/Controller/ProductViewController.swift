//
//  ProductViewController.swift
//
//  Created by Admin on 21/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import Service
import Combine
class ProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
  
    var vm: ProductListViewModel!
    
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    @IBOutlet weak var lblSessionId: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = "Product"
        
        lblSessionId.text =  UserDefaults.standard.string(forKey: UserDefaultKeys.ConfigureSessionId) ?? ""
        lblSessionId.accessibilityIdentifier = "BTTSessionID"
        
        loadData()
    }
    
    func loadData()  {
        
        
        Task {
            let _ =  await vm.loadProducts()
            
            if let error = vm.error{                
                let alert = UIAlertController(title: "Error", message: "Unable to connent with server \(Secrets.baseURL) with error :\(error.localizedDescription)", preferredStyle: UIAlertController.Style.alert)
                       alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                       self.present(alert, animated: true, completion: nil)
            }
            else{
                print("Success loading")
            }
            
            self.ProductCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm?.productList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        let product = vm?.productList[indexPath.row]
        cell.product = product
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let product = vm?.productList[indexPath.row],
           let vc :ProductDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailView") as? ProductDetailViewController
        {
            vc.vm = vm.detailViewModel(for: product.id)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
