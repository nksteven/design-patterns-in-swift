//
//  Floorplan.swift
//  AbstractFactory1
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

protocol Floorplan {
    var seats:Int { get }
    var enginePosition: EngineOption { get }
}

enum EngineOption: String {
    case FRONT = "Front"
    case MID = "Mid"
}

class ShortFloorplan: Floorplan {
    var seats:Int = 2
    var enginePosition: EngineOption = EngineOption.MID
}

class StandardFloorplan: Floorplan {
    var seats: Int = 4
    var enginePosition: EngineOption = EngineOption.FRONT
}

class LongFloorplan : Floorplan {
    var seats: Int = 8
    var enginePosition: EngineOption = EngineOption.FRONT
}
