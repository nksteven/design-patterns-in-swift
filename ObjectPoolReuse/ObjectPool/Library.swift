//
//  Library.swift
//  ObjectPool
//
//  Created by Yang Shaoli on 12/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class Library {
    private let pool:Pool<Book>
    
    private init(stockLevel:Int) {
        var stockId = 0
        
        self.pool = Pool<Book>(maxItemCount:stockLevel, factory:{() in
            stockId += 1
            return BookSeller.buyBook(author: "Dickens, Charles", title: "Hard Times", stockNumber: stockId)
        })
    }
    
    private class var singleton:Library {
        struct SingletonWrapper {
            static let singleton = Library(stockLevel:5)
        }
        
        return SingletonWrapper.singleton
    }
    
    class func checkoutBook(reader:String) -> Book? {
        let book = singleton.pool.getFromPool()
        book?.reader = reader
        book?.checkoutCount += 1
        return book
    }
    
    class func returnBook(book:Book) {
        book.reader = nil
        singleton.pool.returnToPool(item: book)
    }
    
    class func printReport() {
        singleton.pool.processPoolItems(callback: {(books) in
            for book in books {
                print("...Book #\(book.stockNumber)...")
                print("Check Out \(book.checkoutCount) times")
                if ((book.reader) != nil) {
                    print("Check Out to \(book.reader!)")
                } else {
                    print("In stock")
                }
            }
            print("There ara \(books.count) books in the pool")
        })
    }
}
