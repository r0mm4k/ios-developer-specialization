//
//  ProductsVC.swift
//  coder-swag
//
//  Created by Роман Макаров on 6.04.21.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet weak var productsCollection: UICollectionView!
    
    // MARK: - Public Properties
    private(set) public var products = [Product]()

    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        productsCollection.dataSource = self
        productsCollection.delegate = self
    }
    
    // MARK: - Public Methods
    func initProducts(category: Category) {
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            let product = products[indexPath.row]
            cell.updateViews(product: product)
            
            return cell
        }
        
        return ProductCell()
    }
    

}
