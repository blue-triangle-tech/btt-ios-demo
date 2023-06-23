//
//  ProductViewController.swift
//
//  Created by Admin on 21/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    let vm = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = "Product"
        config()
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        let product = vm.product[indexPath.row]
        cell.product = product
//        for i in 0..<product.images.count{
//            print(product.images[i])
//        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell:ProductDetailView = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailView") as? ProductDetailView
        {
            let product = vm.product[indexPath.row]
            cell.strTitle = product.name
            cell.strPrice = product.price
            cell.img = product.image
            cell.strDesc = product.description
            
            self.navigationController?.pushViewController(cell, animated: true)
        }
    }
    
    private func config() {
        initAPI()
        reloadEvent()
    }
    
    private func initAPI() {
        vm.fetchAPI()
    }
    
    private func reloadEvent(){
        vm.eventHandler = { [weak self] event in
            
            guard let self else { return }
            
            switch event {
                
            case .loading:
                print("loading")
            case .stopLoading:
                print("Stoploading")
            case .dataLoaded:
                DispatchQueue.main.async {
                    self.ProductCollectionView.reloadData()
                }
                print("dataloaded")
            case .error(let error):
                print(error!)
            }
        }
    }
}

//var arr = [UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes"),UIImage(named: "clothes")]
//
//var lbl1 = ["Stuff1","Stuff2","Stuff3","Stuff4","Stuff5","Stuff6","Stuff7","Stuff8"]
//
//var lbl2 = ["$1","$2","$3","$4","$5","$6","$7","$8"]
