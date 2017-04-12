//
//  main.swift
//  ObjectPool
//
//  Created by Yang Shaoli on 12/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

var queue = DispatchQueue(label:"workQ", attributes:.concurrent)
var group = DispatchGroup()

for i in 1 ... 20 {
    queue.async(group: group, execute: {() in
        var book = Library.checkoutBook(reader: "reader#\(i)")
        if (book != nil) {
            Thread.sleep(forTimeInterval: Double(arc4random() % 2))
            Library.returnBook(book: book!)
        }
    })
}

group.wait()
print("All blocks complete!")
Library.printReport()
