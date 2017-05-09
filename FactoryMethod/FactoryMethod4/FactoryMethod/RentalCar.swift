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
        var carImp:RentalCar.Type?
        switch (passengers) {
        case 0...3:
            carImp = Compact.self
        case 4...8:
            carImp = SUV.self
        default:
            carImp = nil
        }
        return carImp?.createRentalCar(passengers:passengers)
    }
}

class Compact: RentalCar {
    
    private convenience init() {
        self.init(name: "VM Golf", passengers: 3, price: 20)
    }
    
    fileprivate override init(name:String, passengers:Int, price:Float) {
        super.init(name: name, passengers: passengers, price: price)
    }
    
    override class func createRentalCar(passengers:Int) -> RentalCar? {
        if (passengers < 2) {
            return Compact()
        } else {
            return SmallCompact()
        }
    }
}

class SmallCompact: Compact {
    
    fileprivate init() {
        super.init(name: "Ford Fiesta", passengers: 3, price: 15)
    }
}

class SUV: RentalCar {
    
    fileprivate init() {
        super.init(name: "Cadillac Escalade", passengers: 8, price: 75)
    }
    
    override class func createRentalCar(passengers:Int) -> RentalCar? {
        return SUV()
    }
}
