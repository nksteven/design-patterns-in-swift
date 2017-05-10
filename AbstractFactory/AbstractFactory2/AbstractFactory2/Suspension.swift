//
//  Suspension.swift
//  AbstractFactory1
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

protocol Suspension {
    var suspensionType: SuspensionOption { get }
}

enum SuspensionOption: String {
    case STANDARD = "standard"
    case SPORTS = "Firm"
    case SOFT = "Soft"
}

class RoadSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.STANDARD
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.SOFT
}

class RaceSuspension: Suspension {
    var suspensionType: SuspensionOption = SuspensionOption.SPORTS
}
