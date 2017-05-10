//
//  CarParts.swift
//  AbstractFactory1
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

enum Cars: String {
    case COMPACT = "VW Golf"
    case SPORT = "Porsche Boxter"
    case SUV = "Cadillac Escalade"
}

class Car {
    var carType: Cars
    var floor: Floorplan
    var suspension: Suspension
    var drive: Drivetrain
    
    init(carType: Cars, floor: Floorplan, suspension:Suspension, drive: Drivetrain) {
        self.carType = carType
        self.floor = floor
        self.suspension = suspension
        self.drive = drive
    }
    
    func printDetail() {
        print("Car Type: \(carType.rawValue)")
        print("Seats: \(floor.seats)")
        print("Engine: \(floor.enginePosition.rawValue)")
        print("Suspension: \(suspension.suspensionType.rawValue)")
        print("Drive: \(drive.driveType.rawValue)")
    }
}
