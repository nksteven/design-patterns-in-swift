//
//  main.swift
//  SimpleSample
//
//  Created by Yang Shaoli on 21/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

var products = [
    ("Kayak", 275, 10),
    ("Lifejacket", 48.95, 14),
    ("Soccer Ball", 19.5, 32)];

func calculateTax(product:(String, Double, Int)) -> Double {
    return product.1 * 0.2
}

func calculateStockValue(tuples:[(String, Double, Int)]) -> Double {
    return tuples.reduce(0, {(total, product) -> Double in
         return total + (product.1 * Double(product.2))
    });
}

print("Sales tax for Kayak: $\(calculateTax(product: products[0]))");
print("Total value of stock: $\(calculateStockValue(tuples: products))");
print("Stock Level for Kayak: \(products[0].2)");
