//
//  Login.swift
//  Carpooling
//
//  Created by Aashay on 3/28/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

class Login: NSObject {
    
    var email : String!
    
    init( email: String) {
        super.init()
        self.email = email
    }
}
class LoginUser {
    var theUser: [Login] = []
    
    init(cuser: Login) {
        var user: Login
        user = Login( email: cuser.email)
        theUser.append(user)
    }
    
    func RetrieveUserFromClass() -> [Login] {
        return theUser
    }
    
}
