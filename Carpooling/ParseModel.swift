//
//  ParseModel.swift
//  Carpooling
//
//  Created by Cesar on 3/5/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import Parse
private var login : Login!
private var prefer : Prefer!
private var User1 : User!
var stuff : ProfileViewController!
var currentUser : CurrentUser!
var loginUser : LoginUser!
var pUser : PUser!

class ParseModel {
    
    var Parser : [PFQuery]
    
    init() {
        Parser = []
    }
    
    func uploadProfileImage( file : PFFile, emailRetrieved: String, age : String, username : String, password : String){
        
        var objectid : String!
        
        print("in parse model")
        
        // retrieving object id
        var user = PFQuery(className:"User")
        user.whereKey("user_email", equalTo:emailRetrieved)
        user.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count)objects")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        var email : AnyObject = object.valueForKey("user_email")!
                        var emailPassed  = email as String
                        println("retirver id " + emailPassed)
                        
                        if (emailRetrieved == emailPassed){
                            objectid  = object.objectId
                            println(objectid)
                            user.getObjectInBackgroundWithId(objectid){
                                (edit_user: PFObject?, error: NSError?) -> Void in
                                if error != nil {
                                    println(error)
                                } else if let  edit_user = edit_user {
                                    println("inside")
                                    edit_user["image"] = file
                                    edit_user["age"] =  age
                                    edit_user["user_email"] = username
                                    edit_user["password"] = password
                                    print (age, username, password)
                                    edit_user.saveInBackground()
                                }
                            }
                            
                        }
                    }
                }
            }
            
            
            
        }
        
    }
    
    

    

    func RetrieveDataForSearch(numOccupant: String, numLuggage: String , Role1 : String , GoingFrom: String, GoingTo: String, completion: (user: Prefer) -> Void) {
        var index: Int
        var user0: Prefer!
        var list: Prefer = Prefer()
        //for index=0 ; index<20; ++index{
        //print(Role1)
        var user = PFQuery(className:"Preferences")
        //user.whereKey("email", equalTo:loginUsername)
        user.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count)objects")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        var occ: AnyObject = object.valueForKey("occupants")!
                        //println(occ)
                        var lug: AnyObject = object.valueForKey("luggage")!
                        //println(lug)
                        var sou: AnyObject = object.valueForKey("GoingFrom")!
                        //println(sou)

                        var des: AnyObject = object.valueForKey("GoingTo")!
                        //println(des)

                        var roledb: AnyObject = object.valueForKey("role")!
                        // For array to get index value 
                        var role : String = roledb[0] as String!
                        println(roledb)
                        if  (occ as? NSObject == numOccupant){
                            println(occ)
                            if (lug as? NSObject == numLuggage){
                                
                                if (sou as? NSObject == GoingFrom){
                                    
                                    if (des as? NSObject == GoingTo){
                                        
                                        if (role  == Role1){
                                        
                                        print("hieeee")
                                        var email: AnyObject = object.valueForKey("user_email")!
                                        println(email)
                                        var user0 = Prefer(email :toString(email))
                                        prefer = user0
                                        var sup: [Prefer]!
                                        pUser = PUser(cuser: user0)
                                        list.list.append(toString(email))
                                
                                        }}}}}
                        else {
                            // Log details of the failure
                            
                            println("Error nothing found")
                        }
                    }}}
            //this is used for closure
            completion(user: list)
        }}
        
    
    
    func RetrieveDataFromDatabase(email: String, completion: (user: CurrentUser) -> Void) {
        var user3 = PFQuery(className:"User")
        user3.whereKey("user_email", equalTo:email)
        user3.findObjectsInBackgroundWithBlock {
            
            (objects: [AnyObject]!, error: NSError!) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                
                if let objects = objects as? [PFObject] {
                    println("Successfully retrieved \(objects.count+1) scores.")
                    for object in objects {
                        var objectID: AnyObject = object.valueForKey("ObjectID")!
                        var email: AnyObject = object.valueForKey("user_email")!
                        var gender: AnyObject = object.valueForKey("gender")!
                        var ageDB: AnyObject = object.valueForKey("age")!
                        var username: AnyObject = object.valueForKey("username")!
                        //need to cast it to an Ints
                        var age = ageDB as Int
                        var language: AnyObject = object.valueForKey("language")!
                        var type: AnyObject = object.valueForKey("type")!
                        println(object.objectId)
                        println("Successfully retrieved \(objects.count+2) scores.")
                        var user = User(type: toString(type), username: toString(username), age: age, language: toString(language), gender: toString(gender), email: toString(email))
                        //var user0 = User("Driver", username: object.valueForKey("username"), age: object.valueForKey("age"), language: object.valueForKey("language"), gender: object.valueForKey("gender"), email: object.valueForKey("email"))
                        User1 = user
                        var sup: [User]!
                        currentUser = CurrentUser(cuser: user)
                        
                        //this is used for closure
                        completion(user: currentUser)
                    }
                }
            }
                
            else {
                // Log details of the failure
                println("Error: \(error) \(error.userInfo!)")
            }}}
        
        
        //return User1
        
        
    func LoginUserbyEmail(email: String, password : String, completion: (user: LoginUser) -> Void) {
        var user3 = PFQuery(className:"User")
        user3.whereKey("user_email", equalTo:email)
        user3.findObjectsInBackgroundWithBlock {
            
            (objects: [AnyObject]!, error: NSError!) -> Void in
            
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                
                if let objects = objects as? [PFObject] {
                    println("Successfully retrieved \(objects.count+1) scores.")
                    for object in objects {
                        var email1 = object.valueForKey("user_email")
                        println(email)
                        var pass = object.valueForKey("password")
                        print(pass)
                        
                        
                        if  (email1 as NSObject == email){
                            
                            if (pass as NSObject == password){
                                
                                
                                println("Successfully retrieved \(objects.count+2)")
                                var use = Login(email: toString(email))
                                //var user0 = User("Driver", username: object.valueForKey("username"), age: object.valueForKey("age"), language: object.valueForKey("language"), gender: object.valueForKey("gender"), email: object.valueForKey("email"))
                                login = use
                                var sup: [Login]!
                                loginUser = LoginUser(cuser: use)
                                
                                //this is used for closure
                                completion(user: loginUser)
                                
                            }
                        }
                            
                            
                        else {
                            // Log details of the failure
                            println("Error: \(error) \(error.userInfo!)")
                            //self.displayMyAlertMessage("Invalid Username!!");
                        }
                    }
                    
                    //return User1
                }
    
    func SearchDatabaseForUser(email: String) -> Bool {
        var status : Bool = false
        var user3 = PFQuery(className:"User")
        user3.whereKey("email", equalTo:email)
        user3.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        var user: AnyObject? = object.valueForKey("user_email")
                        println(user)
                        var pass: AnyObject? = object.valueForKey("password")
                        print(pass)
                        if (user as? NSObject == email){
                            status = true
                        }else {
                            // Log details of the failure
                            println("Error: \(error) \(error.userInfo!)")
                        }
                    }
                }
            }
        }
        return status
    }
}
}
}
}

