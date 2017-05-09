//
//  PriceCalculator.swift
//  FactoryMethod
//
//  Created by Yang Shaoli on 05/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class PriceCalculator {
    class func calculatorPrice(passengers:Int, days:Int) -> Float? {
        let car = RentalCar.createRentalCar(passengers: passengers)
        return car == nil ? nil : car!.pricePerDay * Float(days)
    }
}
