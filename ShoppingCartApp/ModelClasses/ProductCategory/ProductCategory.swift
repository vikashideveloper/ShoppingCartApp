//
//  ProductCategory.swift
//  ShoppingCartApp
//
//  Created by Vikash Kumar on 15/06/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import Foundation

class ProductCategory {
    var id = ""
    var name = ""
    var imgUrlString = ""
    
    var imgUrl: URL? {return URL(string: imgUrlString)}
    
}

