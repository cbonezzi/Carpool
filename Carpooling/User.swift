//
//  UserModel.swift
//  Carpooling
//
//  Created by Cesar on 3/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit

class User: NSObject {
    var type : String!
    var username : String!
    var age : Int!
    var language : String!
    var gender : String!
    var email : String!
    
    init(type: String, username: String, age: Int, language: String, gender: String, email: String) {
        super.init()
        self.type = type
        self.username = username
        self.age = age
        self.language = language
        self.gender = gender
        self.email = email
    }
}

class CurrentUser {
    var theUser: [User] = []
    
    init(cuser: User) {
        var user: User
        user = User(type: cuser.type, username: cuser.username, age: cuser.age, language: cuser.language, gender: cuser.gender, email: cuser.email)
        theUser.append(user)
    }
    
    func RetrieveUserFromClass() -> [User] {
        return theUser
    }
    
}

class ListOfUsers {
    var ListUser: [User] = []
    
}
