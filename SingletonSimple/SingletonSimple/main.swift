//
//  main.swift
//  SingletonSimple
//
//  Created by Yang Shaoli on 10/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

print("Hello, World!")

var server = BackupServer.server

let queue = DispatchQueue(label: "workQueue")

for count in 0..<100 {
    queue.sync(execute: {() in BackupServer.server.backup(item: DataItem(type: DataItem.ItemType.Email, data: "bob@example.com"))})
}

print("\(server.getData().count) items were backed up")

