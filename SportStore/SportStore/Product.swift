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
    fileprivate var salesTaxRate:Double = 0.2
    
    required init(name:String, description:String, category:String, price:Double, stockLevel:Int) {
        self.name = name
        self.productDescription = description
        self.category = category
        
        super.init()
        
        self.priceBackingValue = price
        self.stockLevelBackingValue = stockLevel
    }
    
    class func createProduct(name:String, description:String, category:String, price:Double, stockLevel:Int) -> Product {
        var productType:Product.Type
        switch category {
        case "Watersports":
            productType = WatersportsProduct.self
        case "Soccer":
            productType = SoccerProduct.self
        default:
            productType = Product.self
        }
        
        return productType.init(name:name, description:description, category:category, price:price, stockLevel:stockLevel)
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
            return price * (1 + salesTaxRate) * Double(stockLevel)
        }
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Product(name: self.name, description: self.productDescription, category: self.category, price: self.price, stockLevel: self.stockLevel)
    }
    
    var upsells:[UpsellOpportunities] {
        get {
            return Array()
        }
    }
}

enum UpsellOpportunities {
    case SwimmingLessions
    case MapOfLakes
    case SoccerVideos
}

class WatersportsProduct : Product {
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        
        salesTaxRate = 0.10
    }
    
    override var upsells: [UpsellOpportunities] {
        get {
            return [UpsellOpportunities.SwimmingLessions, UpsellOpportunities.MapOfLakes]
        }
    }
}

class SoccerProduct : Product {
    required init(name: String, description: String, category: String, price: Double, stockLevel: Int) {
        super.init(name: name, description: description, category: category, price: price, stockLevel: stockLevel)
        
        salesTaxRate = 0.25
    }
    
    override var upsells: [UpsellOpportunities] {
        return [UpsellOpportunities.SoccerVideos]
    }
}


