//
//  ProductCell.swift
//  coder-swag
//
//  Created by Роман Макаров on 6.04.21.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    // MARK: - Public Methods
    func updateViews(product: Product) {
        productImage.image = UIImage(named: product.image)
        productLabel.text = product.title
        productPrice.text = product.price
    }
    
}
