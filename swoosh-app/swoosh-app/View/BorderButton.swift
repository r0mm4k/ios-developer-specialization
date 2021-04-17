//
//  BorderButton.swift
//  swoosh-app
//
//  Created by Роман Макаров on 13.03.21.
//

import UIKit

class BorderButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.white.cgColor
    }

}
