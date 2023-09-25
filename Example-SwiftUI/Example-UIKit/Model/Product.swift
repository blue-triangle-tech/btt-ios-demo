//
//  Product.swift
//
//  Created by Admin on 22/06/23.
//  Copyright © 2023 Blue Triangle. All rights reserved.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let price: String
  //  let images: [String]
    let description: String
}
