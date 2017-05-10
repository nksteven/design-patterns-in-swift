//
//  Drivetrains.swift
//  AbstractFactory1
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

protocol Drivetrain {
    var driveType: DriveOption { get }
}

enum DriveOption: String {
    case FRONT = "Front"
    case FEAR = "Rear"
    case ALL = "4WD"
}

class FrontWheelDrive: Drivetrain {
    var driveType: DriveOption = DriveOption.FRONT
}

class RearWheelDrive: Drivetrain {
    var driveType: DriveOption = DriveOption.FEAR
}

class AllWheelDrive: Drivetrain {
    var driveType: DriveOption = DriveOption.ALL
}
