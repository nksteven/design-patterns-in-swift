//
//  StockValueFactories.swift
//  SportStore
//
//  Created by Yang Shaoli on 10/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class StockTotalFactory {
    enum Currency {
        case USD
        case GBP
    }
    
    fileprivate(set) var formatter:StockValueFormatter?
    fileprivate(set) var converter:StockValueConverter?
    
    class func getFactory(curr:Currency) -> StockTotalFactory {
        switch curr {
        case .USD:
            return DollarStockTotalFactory.sharedInstance
        case .GBP:
            return PoundStockTotalFactory.sharedInstance
        }
    }
}

fileprivate class DollarStockTotalFactory: StockTotalFactory {
    private override init() {
        super.init()
        formatter = DollarStockValueFormatter()
        converter = DollarStockValueConverter()
    }
    
    class var sharedInstance:StockTotalFactory {
        get {
            struct SingletonWrapper {
                static let singleton = DollarStockTotalFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}

fileprivate class PoundStockTotalFactory: StockTotalFactory{
    private override init() {
        super.init()
        formatter = PoundStockValueFormatter()
        converter = PoundStockValueConverter()
    }
    
    class var sharedInstance:StockTotalFactory {
        get {
            struct SingletonWrapper {
                static let singleton = PoundStockTotalFactory()
            }
            return SingletonWrapper.singleton
        }
    }
}
