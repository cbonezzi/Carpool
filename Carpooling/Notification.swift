//
//  NotificationModel.swift
//  Carpooling
//
//  Created by Cesar on 3/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit

class Notification: NSObject {
    var current_location : String!
    var current_destination : String!
    
    init(current_location: String, current_destination: String) {
        super.init()
        
        self.current_location = current_location
        self.current_destination = current_destination
    }
}


class CurrentNotification {
    var theUserNotification: [Notification] = []
    
    init(cnotification: Notification) {
        var usernotifications: Notification
        usernotifications = Notification(current_location: cnotification.current_destination, current_destination: cnotification.current_destination)
        theUserNotification.append(usernotifications)
    }
    
    func RetrieveNotificationFromClass() -> [Notification] {
        return theUserNotification
    }
    
}
