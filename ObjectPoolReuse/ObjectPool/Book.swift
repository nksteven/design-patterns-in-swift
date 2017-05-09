//
//  Book.swift
//  ObjectPool
//
//  Created by Yang Shaoli on 12/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class Book: PoolItem {
    var author:String
    var title:String
    var stockNumber:Int
    var reader:String?
    var checkoutCount = 0
    
    init(author:String, title:String, stock:Int) {
        self.author = author
        self.title = title
        self.stockNumber = stock
    }
    
    var canReuse: Bool {
        get {
            let reusable = checkoutCount < 5
            if (!reusable) {
                print("Reject: Book#\(self.stockNumber)")
            }
            return reusable
        }
    }
}
