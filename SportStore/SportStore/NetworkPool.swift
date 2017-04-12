//
//  NetworkPool.swift
//  SportStore
//
//  Created by Yang Shaoli on 12/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class NetworkPool {
    private let connectionCount = 3
    private var connections = [NetworkConnection]()
    private var semaphore:DispatchSemaphore
    private var queue:DispatchQueue
    
    init() {
        for _ in 0 ..< connectionCount {
            connections.append(NetworkConnection())
        }
        semaphore = DispatchSemaphore(value: connectionCount)
        queue = DispatchQueue(label:"networkpoolQ")
    }
    
    private func doGetConnection() -> NetworkConnection {
        semaphore.wait()
        var result:NetworkConnection? = nil
        queue.sync {
            () in result = self.connections.removeFirst()
        }
        return result!
    }
    
    private func doReturnConnection(conn:NetworkConnection) {
        queue.async(execute: {() in
            self.connections.append(conn)
            self.semaphore.signal()
        })
    }
    
    class func getConnection() -> NetworkConnection {
        return NetworkPool.sharedInstance.doGetConnection()
    }
    
    class func returnConnnection(conn:NetworkConnection) {
        NetworkPool.sharedInstance.doReturnConnection(conn:conn)
    }
    
    private class var sharedInstance:NetworkPool {
        get {
            struct SingletonWrapper {
                static let singleton = NetworkPool()
            }
            
            return SingletonWrapper.singleton
        }
    }
}
