//
//  Product.swift
//  SportStore
//
//  Created by Yang Shaoli on 29/03/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class Product : NSObject, NSCopying {
    private(set) var name:String
    private(set) var productDescription:String
    private(set) var category:String
    private var priceBackingValue:Double=0.0
    private var stockLevelBackingValue:Int=0
    
    init(name:String, description:String, category:String, price:Double, stockLevel:Int) {
        self.name = name
        self.productDescription = description
        self.category = category
        
        super.init()
        
        self.priceBackingValue = price
        self.stockLevelBackingValue = stockLevel
    }
    
    var stockLevel:Int {
        get { return self.stockLevelBackingValue}
        set { stockLevelBackingValue = max(0, newValue)}
    }
    
    private(set) var price:Double {
        get { return self.priceBackingValue}
        set { priceBackingValue = max(1, newValue)}
    }
    
    var stockValue:Double {
        get {
            return price * Double(stockLevel)
        }
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Product(name: self.name, description: self.productDescription, category: self.category, price: self.price, stockLevel: self.stockLevel)
    }
}
