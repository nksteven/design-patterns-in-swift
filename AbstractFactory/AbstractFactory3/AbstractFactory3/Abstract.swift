//
//  Abstract.swift
//  AbstractFactory2
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class CarFactory {
    func createFloorplan() -> Floorplan {
        fatalError("Not implemented!")
    }
    
    func createSuspension() -> Suspension {
        fatalError("Not implemented!")
    }
    
    func createDrivetrain() -> Drivetrain {
        fatalError("Not implemented!")
    }
    
    final class func getFactory(car:Cars) -> CarFactory? {
        var factory:CarFactory
        switch car {
        case .COMPACT:
            factory = CompactCarFactory()
        case .SPORT:
            factory = SportCarFactory()
        case .SUV:
            factory = SUVCarFactory()
        }
        
        return factory
    }
}
