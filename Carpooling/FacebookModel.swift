//
//  FacebookModel.swift
//  Carpooling
//
//  Created by Cesar on 3/5/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit
import Parse

class FacebookModel: NSObject, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView : FBLoginView!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailAddressText: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    private var User1 : User!
    //var stuff : ViewController!
    var currentUser : CurrentUser!
    
    //self.fbLoginView.delegate = self
    //self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        //stuff.User11.description()
//        self.fbLoginView.delegate = self
//        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
//        
//        
//    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        //self.fbLoginView.delegate = self
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) -> CurrentUser{
        self.fbLoginView.delegate = self
        var new_user = PFObject(className: "User")
        new_user["email"] = user.objectForKey("email") as String
        new_user["username"] = (user.name)
        new_user["gender"] = user.objectForKey("gender") as String
        new_user.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
        var user0 = User(type: "Driver", username: user.name, age: 20, language: toString(user.location), gender: toString(user.objectForKey("gender")), email: toString(user.objectForKey("email")))
        User1 = user0
        var sup: [User]!
        currentUser = CurrentUser(cuser: user0)
        
        //User1.storeUser(user0)
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
        return currentUser
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
//    @IBAction func onSegmentedControlPressed(sender: UISegmentedControl) {
//        //User("Driver", username: "Cesar", age: 20, language: ["English"], gender: "Male", email: "cesar@gmail.com")
//        if sender.selectedSegmentIndex == 0{
//            emailAddressText.enabled = false
//            passwordText.enabled = false
//            submitButton.enabled = false
//        }
//        else if sender.selectedSegmentIndex == 1{
//            emailAddressText.enabled = true
//            passwordText.enabled = true
//            submitButton.enabled = true
//        }
//    }
//    @IBAction func onSubmitPressed(sender: UIButton) {
//        var new_user = PFObject(className:"User")
//        new_user["email"] = emailAddressText.text
//        new_user["password"] = passwordText.text
//        new_user.saveInBackgroundWithBlock {
//            (success: Bool, error: NSError!) -> Void in
//            if (success) {
//                // The object has been saved.
//            } else {
//                // There was a problem, check error.description
//            }
//        }
//        
//        // cesar! you need to create an instance of the database client and app key, in order to access parse services!!!
//        //var gameScore = PFQuery(className:"User")
//        
//        // this block is use to retrieve data from parse
//        //var result = gameScore.whereKey("username", equalTo:emailAddressText.text)
//        //gameScore.findObjectsInBackgroundWithBlock(<#block: PFArrayResultBlock!##([AnyObject]!, NSError!) -> Void#>)
//        //            if error != nil {
//        //
//        //            } else {
//        //                gameScore1["cheatMode"] = true
//        //                gameScore1["score"] = 1338
//        //                gameScore1.saveInBackground()
//        //            }
//        //}
//        //gameScore["score"] = 1337
//        //gameScore["playerName"] = "Sean Plott"
//        //gameScore["email"] = emailAddressText.text
//        //gameScore.saveInBackgroundWithBlock {
//        //            (success: Bool, error: NSError!) -> Void in
//        //            if (success) {
//        //                // The object has been saved.
//        //            } else {
//        //                // There was a problem, check error.description
//        //            }
//        //        }
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}