//
//  Logger.swift
//  SingletonSimple
//
//  Created by Yang Shaoli on 10/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

let globalLogger = Logger()

final class Logger {
    private var data = [String]()
    private let arrayQ = DispatchQueue(label: "arrayQ")
    fileprivate init() {
        
    }
    
    func log(msg:String) {
        arrayQ.sync {
            data.append(msg)
        }
    }
    
    func printLog() {
        for msg in data {
            print("Log: \(msg)")
        }
    }
}
