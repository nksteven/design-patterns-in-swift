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
    
    init(carType: Cars) {
        let factory = CarFactory.getFactory(car: carType)
        self.carType = carType
        self.floor = factory!.createFloorplan()
        self.suspension = factory!.createSuspension()
        self.drive = factory!.createDrivetrain()
    }
    
    func printDetail() {
        print("Car Type: \(carType.rawValue)")
        print("Seats: \(floor.seats)")
        print("Engine: \(floor.enginePosition.rawValue)")
        print("Suspension: \(suspension.suspensionType.rawValue)")
        print("Drive: \(drive.driveType.rawValue)")
    }
}
