//
//  DriverModel.swift
//  Carpooling
//
//  Created by Cesar on 3/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit

class Driver: NSObject {
    var capacity : Int!
    
    init(capacity: Int) {
        super.init()
        
        self.capacity = capacity
    }
}


class CurrentDriver {
    var theUserDriver: [Driver] = []
    
    init(cdriver: Driver) {
        var userdriver: Driver
        userdriver = Driver(capacity: cdriver.capacity)
        theUserDriver.append(userdriver)
    }
    
    func RetrieveDriverFromClass() -> [Driver] {
        return theUserDriver
    }
    
}
