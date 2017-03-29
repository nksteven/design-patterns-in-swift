//
//  Logger.swift
//  SportStore
//
//  Created by Yang Shaoli on 29/03/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class Logger <T> where T:NSObject, T:NSCopying {
    var dataItems:[T] = []
    var callback:(T) -> Void
    
    init(callback:@escaping (T)->Void) {
        self.callback = callback
    }
    
    func log(item:T) -> Void {
        dataItems.append(item.copy() as! T)
        self.callback(item)
    }
    
    func processItems(callback:(T)->Void) -> Void {
        for item in dataItems {
            callback(item)
        }
    }
}
