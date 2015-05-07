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

var alert = UIAlertView(title: "Alert", message: "Sorry, that combination does not exist.", delegate: nil, cancelButtonTitle: "OK")

class ParseModel {
    
    
    var Parser : [PFQuery]
    
    init() {
        Parser = []
    }
    
    var alert2 = UIAlertView(title: "Alert", message: "profile Updated!", delegate: nil, cancelButtonTitle: "OK")
    
    func displayMyAlertMessage2()
    {
        alert2.show()
        
    }
    
    var alert = UIAlertView(title: "Alert", message: "Password changed!", delegate: nil, cancelButtonTitle: "OK")
    
    func displayMyAlertMessage()
    {
        alert.show()
        
    }
    var alert1 = UIAlertView(title: "Alert", message: "No user Found", delegate: nil, cancelButtonTitle: "OK")
    
    func displayMyAlertMessage1()
    {
        alert1.show()
        
    }
    
    
    
    
    func  changePassword(emailRetrieved: String , password : String){
        
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
                                    
                                    edit_user["password"] = password
                                    
                                    print (password)
                                    edit_user.saveInBackground()
                                    self.displayMyAlertMessage()
                                    
                                    
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    func uploadImageRegisterUser(file : PFFile, emailRetrieved: String){
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
                                    edit_user.saveInBackground()
                                    //self.displayMyAlertMessage2()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func uploadProfileImage( file : PFFile, emailRetrieved: String, age : String, /*username : String,*/ gender : [String]){
        
        
        
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
                                    edit_user["user_email"] = emailRetrieved
                                    edit_user["gender"] = gender
                                    
                                    print (age, emailRetrieved)
                                    edit_user.saveInBackground()
                                    self.displayMyAlertMessage2()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    func  uploadDataPreferences(email : String , minAge : String, maxAge: String, music: String, smoker : [String], date : String , occupants : String , luggage : String, gender : [String], role : [String], goingFrom: String , goingTo : String, fromState: String, toState: String){
        
        var user = PFQuery(className:"Preferences")
        user.whereKey("user_email", equalTo:email)
        user.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                println("in parse" + email)
                println("Successfully retrieved \(objects.count)objects")
                // Do something with the found objects
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        var email : AnyObject = object.valueForKey("user_email")!
                        var emailPassed  = email as String
                        println("retirver id " + emailPassed)
                        
                        if (email as NSString == emailPassed){
                            println("uploading data")
                            println(date)
                            object["music_taste"] = music
                            object["Smoker"] = smoker
                            object["gender"] = gender
                            object["GoingFrom"] = goingFrom
                            object["GoingTo"] = goingTo
                            object["role"] = role
                            object["occupants"] = occupants
                            object["luggage"] = luggage
                            object["Date"] = date
                            object["max_age"] = maxAge
                            object["min_age"] = minAge
                            object["fromState"] = fromState
                            object["toState"] = toState
                            
                            
                            
                            
                            object.saveInBackgroundWithBlock {
                                (success: Bool, error: NSError!) -> Void in
                                if (success) {
                                    println("added alll in preferences")
                                } else {
                                    // There was a problem, check error.description
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func RetrieveDataForSearch(numOccupant: String, numLuggage: String , Role1 : String , GoingFrom: String, GoingTo: String, date: String , fromState : String,  toState : String , completion : (user: Prefer) -> Void) {
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
                        var des : AnyObject = object.valueForKey("GoingTo")!
                        
                        var state1: AnyObject = object.valueForKey("fromState")!
                        
                        var state2: AnyObject = object.valueForKey("toState")!
                        //println(des)
                        
                        var roledb: AnyObject = object.valueForKey("role")!
                        
                        var datedb: AnyObject = object.valueForKey("Date")!
                        println(datedb)
                        // println(datedb)
                        //println(date)
                        // For array to get index value
                        var role : String = roledb[0] as String!
                        //println(roledb)
                        if  (occ as? NSObject == numOccupant){
                            println(occ)
                            if (lug as? NSObject == numLuggage){
                                
                                if (sou as? NSObject == GoingFrom){
                                    
                                    if (des as? NSObject == GoingTo){
                                        
                                        if (state1 as? NSObject == fromState){
                                            
                                            if (state2 as? NSObject == toState){


                                        
                                                if (role  == Role1){
                                            
                                                    if(datedb as? NSObject == date){
                                                
                                                        print("users found")
                                                        var email: AnyObject = object.valueForKey("user_email")!
                                                        println(email)
                                                        var user0 = Prefer(email :toString(email))
                                                        prefer = user0
                                                        var sup: [Prefer]!
                                                        pUser = PUser(cuser: user0)
                                                        list.list.append(toString(email))
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else {
                            // Log details of the failure
                            
                            println("Error nothing found")
                            //self.displayMyAlertMessage1()
                        }
                    }
                }
            }
            //this is used for closure
            completion(user: list)
        }
    }
        
    
    
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
                                
                            } else {
                                self.alert.show();
                            }
                        }
                            
                        else {
                            // Log details of the failure
                            println("Error: \(error) \(error.userInfo!)")
                            //self.displayMyAlertMessage("Invalid Username!!");
                        }
                        
                    }
                    
                    if(objects.count == 0){
                        self.alert.show();
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

