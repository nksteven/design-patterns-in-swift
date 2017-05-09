//
//  RentalCar.swift
//  FactoryMethod
//
//  Created by Yang Shaoli on 04/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

protocol RentalCar {
    var name:String { get }
    var passengers:Int { get }
    var pricePerDay:Float { get }
}

class Compact: RentalCar {
    var name = "VM Golf"
    var passengers: Int = 3
    var pricePerDay: Float = 20
}

class Sports: RentalCar {
    var name = "Porsche boxster"
    var passengers: Int = 1
    var pricePerDay: Float = 100
}

class SUV: RentalCar {
    var name: String = "Cadillac Escalade"
    var passengers: Int = 8
    var pricePerDay: Float = 75
}
