//
//  Pool.swift
//  ObjectPool
//
//  Created by Yang Shaoli on 12/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class Pool<T> {
    private var data = [T]()
    private let arrayQ = DispatchQueue(label:"arrayQ")
    private let semaphore:DispatchSemaphore
    
    init(items:[T]) {
        data.reserveCapacity(data.count)
        for item in items {
            data.append(item)
        }
        semaphore = DispatchSemaphore(value: data.count)
    }
    
    func getFromPool() -> T? {
        var result:T?
        semaphore.wait()
        arrayQ.sync {
            result  = self.data.removeFirst()
        }
        
        return result
    }
    
    func returnToPool(item:T) {
        arrayQ.sync {
            self.data.append(item)
            semaphore.signal()
        }
    }
}
