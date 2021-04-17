//
//  Wage.swift
//  shopper
//
//  Created by Роман Макаров on 19.03.21.
//

import Foundation

class Wage {
    
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        return Int(ceil(price / wage))
    }
}
