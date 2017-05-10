//
//  main.swift
//  AbstractFactory1
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

var car = Car(carType: Cars.SPORT,
              floor: ShortFloorplan(),
              suspension: RaceSuspension(),
              drive: RearWheelDrive())

car.printDetail()
