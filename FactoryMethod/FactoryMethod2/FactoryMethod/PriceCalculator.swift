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
        var car:RentalCar?
        switch (passengers) {
        case 0...1:
            car = Sports()
        case 2...3:
            car = Compact()
        case 4...8:
            car = SUV()
        case 9...14:
            car = Minivan()
        default:
            car = nil
        }
        return car == nil ? nil : car!.pricePerDay * Float(days)
    }
}
