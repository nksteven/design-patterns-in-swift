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
        return RentalCar.createRentalCar(passengers: passengers)?.name
    }
}
