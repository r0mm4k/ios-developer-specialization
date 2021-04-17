//
//  Category.swift
//  coder-swag
//
//  Created by Роман Макаров on 5.04.21.
//

import Foundation

struct Category {
    
    private(set) public var title: String
    private(set) public var image: String
    
    init(title: String, image: String) {
        self.title = title
        self.image = image
    }
    
}
