//
//  BookSources.swift
//  ObjectPool
//
//  Created by Yang Shaoli on 13/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class BookSeller {
    class func buyBook(author:String, title:String, stockNumber:Int) -> Book {
        return Book(author: author, title: title, stock: stockNumber)
    }
}
