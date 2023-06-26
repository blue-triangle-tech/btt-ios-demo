//
//  ProductCollectionViewCell.swift
//
//  Created by Admin on 23/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import UIKit
import Service
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
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: product.image)
                DispatchQueue.main.async {
                    self.imgProduct.image = UIImage(data: data)
                }
            } catch {
                print(error)
            }
        }
    }
}
