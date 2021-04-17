//
//  CategoryCell.swift
//  coder-swag
//
//  Created by Роман Макаров on 5.04.21.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    // MARK: - IB Outlets
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - Public Methods
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.image)
        categoryLabel.text = category.title
    }

}
