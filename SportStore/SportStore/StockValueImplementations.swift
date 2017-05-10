//
//  StockValueImplementations.swift
//  SportStore
//
//  Created by Yang Shaoli on 10/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

protocol StockValueFormatter {
    func formatTotal(total: Double) -> String
}

class DollarStockValueFormatter: StockValueFormatter {
    func formatTotal(total: Double) -> String {
        let formatted = Utils.currencyStringFromNumber(number: total)
        return "$\(String(formatted.characters.dropFirst()))"
    }
}

class PoundStockValueFormatter: StockValueFormatter {
    func formatTotal(total: Double) -> String {
        let formatted = Utils.currencyStringFromNumber(number: total)
        return "£\(String(formatted.characters.dropFirst()))"
    }
}

protocol StockValueConverter {
    func convertTotal(total: Double) -> Double
}

class DollarStockValueConverter: StockValueConverter {
    func convertTotal(total: Double) -> Double {
        return total
    }
}

class PoundStockValueConverter: StockValueConverter {
    func convertTotal(total: Double) -> Double {
        return 0.60338 * total
    }
}
