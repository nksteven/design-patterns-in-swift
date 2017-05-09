//
//  PoolItem.swift
//  ObjectPool
//
//  Created by Yang Shaoli on 13/04/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

@objc protocol PoolItem {
    var canReuse:Bool {get}
}
