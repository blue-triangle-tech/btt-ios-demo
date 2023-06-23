//
//  ProductCollectionViewCell.swift
//
//  Created by Admin on 23/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!

    var product: Product? {
        didSet {
            productAssigned()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func productAssigned() {
        guard let product else { return }
        
        lblTitle.text = product.name
        lblPrice.text = product.price
        do{
            imgProduct.image = try UIImage(data: Data(contentsOf: (URL(string: product.image) ?? URL(string: ""))!))
        }catch {
        }  
    }
}
