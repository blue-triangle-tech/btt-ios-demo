//
//  ProductDetailView.swift
//
//  Created by Admin on 21/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class ProductDetailView: UIViewController {
     
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQty: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var btnAddtoCart: UIButton!
    @IBOutlet weak var txtFieldQty: UITextField!
    
   let vm = ProductViewModel()
    
    var strTitle: String?
    var strPrice: String?
    var strDesc : String?
    var img: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView()
        setupBtn()
        setupLbl()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddToCart(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CheckOutViewController") as? CheckOutViewController
        vc?.strItemPrice = "$\(strPrice)"
        
        self.present(vc!, animated: true)
    }
    
    
    private func pickerView() {
        let picker = UIPickerView()
        picker.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        picker.dataSource = self
        picker.delegate = self
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolbar.sizeToFit()
        
        
        let done = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ProductDetailView.doneClicked))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ProductDetailView.cancelClicked))
        
        toolbar.setItems([cancel, space, done], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        self.txtFieldQty.tintColor = .clear
        self.txtFieldQty.inputView = picker
        self.txtFieldQty.inputAccessoryView = toolbar
    }
    
    private func setupLbl(){
        self.productTitle.text = strTitle
        self.productPrice.text = strPrice
        self.productDesc.text = strDesc
        do {
            self.productImage.image = try UIImage(data: Data(contentsOf: URL(string: img!)!))
        } catch {}
    }
    
    private func setupBtn() {
        // AddToCart Button
        self.btnAddtoCart.layer.cornerRadius = 10
    }
    
    @objc func doneClicked(){
        self.txtFieldQty.resignFirstResponder()
    }
    
    @objc func cancelClicked(){
        txtFieldQty.text = ""
        self.txtFieldQty.resignFirstResponder()
    }
    
}

extension ProductDetailView : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = picker_data[row]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picker_data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtFieldQty.text = picker_data[row]
    }
}

//extension ProductDetailView : UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return vm.product.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell: ProductDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCollectionViewCell", for: indexPath) as! ProductDetailCollectionViewCell
//        
//        let product = vm.product[indexPath.row].images
//        //cell.productImages.image = product
//        
//        return cell
//    }
//    
//    
//}

var picker_data = ["1","2","3","4","5","6"]
