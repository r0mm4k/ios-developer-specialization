//
//  DataService.swift
//  coder-swag
//
//  Created by Роман Макаров on 5.04.21.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", image: "shirts.png"),
        Category(title: "HOODIES", image: "hoodies.png"),
        Category(title: "HATS", image: "hats.png"),
        Category(title: "DIGITAL", image: "digital.png"),
    ]
    
    private let hats = [
        Product(title: "Devslopes Logo Graphic Beanie", price: "$18", image: "hat01.png"),
        Product(title: "Devslopes Logo Black Hat", price: "$22", image: "hat02.png"),
        Product(title: "Devslopes Logo White Hat", price: "$22", image: "hat03.png"),
        Product(title: "Devslopes Logo Snapback", price: "$15", image: "hat04.png")
    ]
    
    private let hoodies = [
        Product(title: "Devslopes Logo Hoodie Grey", price: "$32", image: "hoodie01.png"),
        Product(title: "Devslopes Logo Hoodie Red", price: "$32", image: "hoodie02.png"),
        Product(title: "Devslopes Hoodie Grey", price: "$32", image: "hoodie03.png"),
        Product(title: "Devslopes Hoodie Black", price: "$32", image: "hoodie04.png")
    ]
    
    private let shirts = [
        Product(title: "Devslopes Logo Shirt Black", price: "$18", image: "shirt01.png"),
        Product(title: "Devslopes Badge Shirt Light Grey", price: "$18", image: "shirt02.png"),
        Product(title: "Devslopes Logo Shirt Red", price: "$18", image: "shirt03.png"),
        Product(title: "Hustle Delegate Grey", price: "$18", image: "shirt04.png"),
        Product(title: "Devslopes Logo Shirt Red", price: "$18", image: "shirt03.png"),
        Product(title: "Hustle Delegate Grey", price: "$18", image: "shirt04.png")
        ]
    
    private let digital = [Product]()
    
    func getCategories() -> [Category] {
       return categories
    }
    
    func getProducts(forCategoryTitle title: String) -> [Product] {
        switch title {
        case "HATS":
            return getHats()
        case "HOODIES":
            return getHoodies()
        case "SHIRTS":
            return getShirts()
        case "DIGITAL":
            return getDigital()
        default:
            return getHats()
        }
    }
    
    func getHats() -> [Product] {
        return hats
    }
    
    func getHoodies() -> [Product] {
        return hoodies
    }
    
    func getShirts() -> [Product] {
        return shirts
    }
    
    func getDigital() -> [Product] {
        return digital
    }
    
}
