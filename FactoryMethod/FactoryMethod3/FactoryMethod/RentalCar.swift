//
//  RentalCar.swift
//  FactoryMethod
//
//  Created by Yang Shaoli on 04/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class RentalCar {
    private var nameBV:String
    private var passengersBV:Int
    private var pricePerDayBV:Float
    
    fileprivate init(name:String, passengers:Int, price:Float) {
        self.nameBV = name
        self.passengersBV = passengers
        self.pricePerDayBV = price
    }
    
    final var name:String {
        get { return self.nameBV }
    }
    
    final var passengers:Int {
        get { return self.passengersBV }
    }
    
    final var pricePerDay:Float {
        get { return self.pricePerDayBV }
    }
    
    class func createRentalCar(passengers:Int) -> RentalCar? {
        var car:RentalCar?
        switch (passengers) {
        case 0...3:
            car = Compact()
        case 4...8:
            car = SUV()
        default:
            car = nil
        }
        return car
    }
}

class Compact: RentalCar {
    
    fileprivate init() {
        super.init(name: "VM Golf", passengers: 3, price: 20)
    }
}

class SUV: RentalCar {
    
    fileprivate init() {
        super.init(name: "Cadillac Escalade", passengers: 8, price: 75)
    }
}
