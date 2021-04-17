//
//  CurrencyTextField.swift
//  shopper
//
//  Created by Роман Макаров on 19.03.21.
//

import UIKit

@IBDesignable
class CurrencyTextField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size * 1.2, height: size))
        
        currencyLabel.backgroundColor = #colorLiteral(red: 0.8708209991, green: 0.8709674478, blue: 0.8708017468, alpha: 0.8009795105)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLabel.layer.cornerRadius = 5.0
        currencyLabel.clipsToBounds = true
        currencyLabel.font = UIFont(name: "Avenir", size: 10)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        currencyLabel.text = formatter.currencySymbol
        
        addSubview(currencyLabel)
    }
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeView()
    }
    
    func customizeView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.245863934)
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 5.0
        textAlignment = .center
        clipsToBounds = true
        
        if let placeholderText = placeholder {
            attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        }
    }
    
}
