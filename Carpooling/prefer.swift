//
//  prefer.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
class Prefer: NSObject {
    
    var email : String!
    var list : [String]!
    
    init( email: String) {
        super.init()
        self.email = email
    }
    
    override init() {
        self.list = []
    }
}
class PUser {
    var theUser: [Prefer] = []
    
    init(cuser: Prefer) {
        var user: Prefer
        user = Prefer( email: cuser.email)
        theUser.append(user)
    }
    
    func RetrieveUserFromClass() -> [Prefer] {
        return theUser
    }
    
}

class CUsersList{
    var listUsers: [Prefer] = []
    
    init() {
        var user: Prefer
        
        
    }
}
