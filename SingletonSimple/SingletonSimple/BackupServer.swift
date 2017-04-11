//
//  BackupServer.swift
//  SingletonSimple
//
//  Created by Yang Shaoli on 10/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class DataItem {
    enum ItemType : String {
        case Email = "Email Address"
        case Phone = "Telephone Number"
        case Card = "Credit Card Number"
    }
    var type:ItemType
    var data:String
    
    init(type:ItemType, data:String) {
        self.type = type
        self.data = data
    }
}

final class BackupServer {
    let name:String
    private var data = [DataItem]()
    
    init(name:String) {
        self.name = name
        globalLogger.log(msg: "Created new server \(name)")
    }
    
    func backup(item:DataItem) {
        data.append(item)
        globalLogger.log(msg: "\(name) backed up item of type \(item.type.rawValue)")
    }
    
    func getData() -> [DataItem] {
        return data
    }
    
    class var server:BackupServer {
        struct SingletonWrapper {
            static let singleton = BackupServer(name:"MainServer")
        }
        return SingletonWrapper.singleton
    }
}
