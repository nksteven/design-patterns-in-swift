//
//  main.swift
//  ConcurrencySimple
//
//  Created by Yang Shaoli on 11/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

var Tom = UserAccount(name:"Tom", currency:1000)
var Jerry = UserAccount(name:"Jerry", currency:1000)

Tom.log()
Jerry.log()

let queue = DispatchQueue(label: "Transaction", attributes: .concurrent)
let group = DispatchGroup()

for count in 0..<200 {
    queue.async(group:group, execute:{() in
        Tom.plus(delta: 1)
        Jerry.minus(delta: 1)
    })
}

group.wait()

Tom.log()
Jerry.log()

