//
//  main.swift
//  AbstractFactory2
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

if let factory = CarFactory.getFactory(car: Cars.SPORT) {
    let car = Car(carType: Cars.SPORT,
                  floor: factory.createFloorplan(),
                  suspension: factory.createSuspension(),
                  drive: factory.createDrivetrain())
    car.printDetail()
}

