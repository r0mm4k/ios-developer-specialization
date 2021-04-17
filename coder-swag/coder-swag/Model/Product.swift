//
//  Product.swift
//  coder-swag
//
//  Created by Роман Макаров on 6.04.21.
//

import Foundation

struct Product {
    
    private(set) public var title: String
    private(set) public var price: String
    private(set) public var image: String
    
    init(title: String, price: String, image: String) {
        self.title = title
        self.price = price
        self.image = image
    }
    
}
