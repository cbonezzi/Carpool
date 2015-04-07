//
//  PassengerModel.swift
//  Carpooling
//
//  Created by Cesar on 3/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit

class Passenger: NSObject {
    var luggage : Int!
    
    init(luggage: Int) {
        super.init()
        
        self.luggage = luggage
    }
}


class CurrentPassengers {
    var theUserPassenger: [Passenger] = []
    
    init(cpassenger: Passenger) {
        var userpassenger: Passenger
        userpassenger = Passenger(luggage: cpassenger.luggage)
        theUserPassenger.append(userpassenger)
    }
    
    func RetrievePassengerFromClass() -> [Passenger] {
        return theUserPassenger
    }
    
}
