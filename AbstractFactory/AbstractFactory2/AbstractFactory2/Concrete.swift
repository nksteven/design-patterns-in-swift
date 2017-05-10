//
//  Concrete.swift
//  AbstractFactory2
//
//  Created by Yang Shaoli on 09/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

class CompactCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return StandardFloorplan()
    }
    
    override func createSuspension() -> Suspension {
        return RoadSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return FrontWheelDrive()
    }
}

class SportCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return ShortFloorplan()
    }
    
    override func createSuspension() -> Suspension {
        return RaceSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return RearWheelDrive()
    }
}

class SUVCarFactory: CarFactory {
    override func createFloorplan() -> Floorplan {
        return LongFloorplan()
    }
    
    override func createSuspension() -> Suspension {
        return OffRoadSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        return AllWheelDrive()
    }
}
