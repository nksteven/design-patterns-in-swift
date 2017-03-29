//
//  Utils.swift
//  SportStore
//
//  Created by Yang Shaoli on 29/03/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class Utils {
    class func currencyStringFromNumber(number:Double) -> String {
        let formatter = NumberFormatter();
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number)) ?? ""
    }
}
