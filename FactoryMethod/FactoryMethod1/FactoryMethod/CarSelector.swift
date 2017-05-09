//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by Yang Shaoli on 04/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class CarSelector {
    class func selectCar(passengers:Int) -> String? {
        var car:RentalCar?
        switch (passengers) {
        case 0...1:
            car = Sports()
        case 2...3:
            car = Compact()
        case 4...8:
            car = SUV()
        default:
            car = nil
        }
        return car?.name
    }
}
