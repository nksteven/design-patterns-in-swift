//
//  UserAccount.swift
//  ConCurrencySimple
//
//  Created by Yang Shaoli on 11/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class UserAccount {
    var name:String
    var currency:Int
    
    init(name:String, currency:Int) {
        self.name = name
        self.currency = currency
    }
    
    func plus(delta:Int) {
        self.currency += delta
    }
    
    func minus(delta:Int) {
        self.currency -= delta
    }
    func log() {
        print("\(name) have $\(currency)")
    }
}
