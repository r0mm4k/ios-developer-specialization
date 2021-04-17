//
//  MainVC.swift
//  shopper
//
//  Created by Роман Макаров on 19.03.21.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var wageTextField: CurrencyTextField!
    @IBOutlet weak var priceTextField: CurrencyTextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculateBtn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        calculateBtn.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        calculateBtn.setTitle("Calculate", for: .normal)
        calculateBtn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calculateBtn.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        wageTextField.inputAccessoryView = calculateBtn
        priceTextField.inputAccessoryView = calculateBtn
        
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }
    
    @objc func calculate() {
        if let wageText = wageTextField.text, let priceText = priceTextField.text {
            if let wage = Double(wageText), let price = Double(priceText) {
                resultLabel.text = String(Wage.getHours(forWage: wage, andPrice: price))
                view.endEditing(true)
                
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
            }
        }
    }

    @IBAction func clearCalculatorPressed(_ sender: Any) {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        
        wageTextField.text = ""
        priceTextField.text = ""
    }
    
}

