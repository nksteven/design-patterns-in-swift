//
//  Pool.swift
//  ObjectPool
//
//  Created by Yang Shaoli on 12/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class Pool<T:AnyObject> {
    private var data = [T]()
    private let arrayQ = DispatchQueue(label:"arrayQ")
    private let semaphore:DispatchSemaphore
    private var itemCount = 0
    private let maxItemCount:Int
    private let itemFactory:() -> T
    
    init(maxItemCount:Int, factory:@escaping () -> T) {
        self.itemFactory = factory
        self.maxItemCount = maxItemCount
        semaphore = DispatchSemaphore(value: maxItemCount)
    }
    
    func getFromPool(maxWaitSeconds:Int = 5) -> T? {
        var result:T?
        if (maxWaitSeconds == -1) {
            semaphore.wait()
        } else {
            let timeoutResult:DispatchTimeoutResult = semaphore.wait(timeout: DispatchTime.now() + DispatchTimeInterval.seconds(maxWaitSeconds))
            if timeoutResult == .timedOut {
                return result
            }
        }
        
        arrayQ.sync {
            if (self.data.count == 0) && (self.itemCount < self.maxItemCount) {
                result = self.itemFactory()
                self.itemCount += 1
            } else {
                result  = self.data.removeFirst()
            }
        }
        
        return result
    }
    
    func returnToPool(item:T) {
        arrayQ.sync {
            let pitem = item as AnyObject as? PoolItem
            if (pitem == nil) || pitem!.canReuse {
                self.data.append(item)
                semaphore.signal()
            }
        }
    }
    
    func processPoolItems(callback:([T])->Void) {
        arrayQ.sync(flags: .barrier, execute: {() in
            callback(self.data)
        })
    }
}
