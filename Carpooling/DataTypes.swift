//
//  DatabaseDataTypes.swift
//  Carpooling
//
//  Created by Cesar on 2/21/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

class DataTypes {
    
    class Users {
        var username : String
        var password : String
        var emailaddress : String
        
        init(username: String, password: String, emailaddress: String) {
            self.username = username
            self.password = password
            self.emailaddress = emailaddress
        }
    }
    
    class Preferences {
        let smoking : String
        let musictaste : String
        let gender : String
        let age : Int
        
        init(smoking: String, musictaste: String, gender: String, age: Int){
            self.smoking = smoking
            self.musictaste = musictaste
            self.gender = gender
            self.age = age
        }
    }
    
    class UserType {
        let driver : String
        let passenger : String
        
        init (driver: String, passenger: String){
            self.driver = driver
            self.passenger = passenger
        }
    }
    
    class DriverType {
        let vehicle_capacity : Int
        
        init (vehicle_capacity: Int){
            self.vehicle_capacity = vehicle_capacity
        }
    }
    
    class PassengerType {
        let luggage : Int?
        
        init (luggage: Int){
            self.luggage = luggage
        }
    }
    
    //for computed property 
    var contents: String {return ""}
}