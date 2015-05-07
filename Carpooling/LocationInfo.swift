//
//  LocationInfo.swift
//  Carpooling
//
//  Created by Cesar on 4/29/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
class LocationInfo: NSObject {
    
    var latitude_source : Double!
    var longitude_source : Double!
    var latitude_destination : Double!
    var longitude_destination : Double!
    var locList : [Double]!
    
    init( lat_src: Double, lon_src: Double, lat_dest: Double, lon_dest: Double) {
        super.init()
        self.latitude_source = lat_src
        self.longitude_source = lon_src
        self.latitude_destination = lat_dest
        self.longitude_destination = lon_dest
    }
    
    override init(){
        self.locList = []
    }
}
class UserLocation {
    var theUserLocation: [LocationInfo] = []
    
    init(cuser: LocationInfo) {
        var userloc: LocationInfo
        userloc = LocationInfo(lat_src: cuser.latitude_source, lon_src: cuser.longitude_source, lat_dest: cuser.latitude_destination, lon_dest: cuser.longitude_destination)
        theUserLocation.append(userloc)
    }
    
    //func RetrieveUserFromClass() -> [Login] {
    //    return theUser
    //}
    
}
