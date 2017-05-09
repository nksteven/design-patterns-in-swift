//
//  main.swift
//  FactoryMethod
//
//  Created by Yang Shaoli on 04/05/2017.
//  Copyright © 2017 Yang Shaoli. All rights reserved.
//

import Foundation

let passengers = [1, 3, 5]
for p in passengers {
    print("\(p) passengers: \(String(describing: CarSelector.selectCar(passengers: p)))")
}
