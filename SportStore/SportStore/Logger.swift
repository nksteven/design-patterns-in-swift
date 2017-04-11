//
//  Logger.swift
//  SportStore
//
//  Created by Yang Shaoli on 29/03/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

let productLogger = Logger<Product>(callback:{p in
    print("Change \(p.name) \(p.stockLevel) items in stock")
})

final class Logger <T> where T:NSObject, T:NSCopying {
    var dataItems:[T] = []
    var callback:(T) -> Void
    var arrayQ = DispatchQueue(label:"arrayQ", attributes:.concurrent)
    var callbackQ = DispatchQueue(label:"callbackQ")
    
    fileprivate init(callback:@escaping (T)->Void, protect:Bool = true) {
        self.callback = callback
        if (protect) {
            self.callback = {(item:T) in
                self.callbackQ.sync {
                    callback(item)
                }}
            print("fldfel")
        }
    }
    
    func log(item:T) -> Void {
        arrayQ.async(flags:.barrier, execute: {
            self.dataItems.append(item.copy() as! T)
            self.callback(item)
        })
    }
    
    func processItems(callback:(T)->Void) -> Void {
        arrayQ.sync {
            for item in dataItems {
                callback(item)
            }
        }
    }
}
