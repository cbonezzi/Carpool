//
//  PreferencesModel.swift
//  Carpooling
//
//  Created by Cesar on 3/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit

class Preferences: NSObject {
    var smoking : Bool! // true or false
    var musictaste : String! // list of genres
    var gender : String! // male, female or both
    
    init(/*type: String, */smoking: Bool, musictaste: String, gender: String /*, luggage: Int*/){
        super.init()
        self.smoking = smoking
        self.musictaste = musictaste
        self.gender = gender
    }
}

class CurrentPreferences {
    var theUserPreferences: [Preferences] = []
    
    init(cpreferences: Preferences) {
        var userpreferences: Preferences
        userpreferences = Preferences(smoking: cpreferences.smoking, musictaste: cpreferences.musictaste, gender: cpreferences.gender)
        theUserPreferences.append(userpreferences)
    }
    
    func RetrievePreferencesFromClass() -> [Preferences] {
        return theUserPreferences
    }
    
}
