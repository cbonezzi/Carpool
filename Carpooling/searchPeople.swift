//
//  searchPeople.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class searchPeople: UIViewController {
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    
    
    @IBOutlet weak var smokingSelection: UISegmentedControl!
    
    @IBOutlet weak var numOccupant: UITextField!
    @IBOutlet weak var numLuggage: UITextField!
    @IBOutlet weak var GoingFrom: UITextField!
    @IBOutlet weak var GoingTo: UITextField!
    
    var loggedUser2 : PUser!
    var stuffUser : Prefer!
    //var searchUserList : SearchUsers!
    
    
    
    func displayMyAlertMessage( userMessage: String)
    {
        var alert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert.addAction(ok);
        
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    
    
    @IBAction func gobackPressed(sender: UIButton) {
         self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    @IBAction func search(sender: AnyObject) {
        
        if (numOccupant.text.isEmpty || numLuggage.text.isEmpty
            || GoingFrom.text.isEmpty || GoingTo.text.isEmpty) {
            
            self.displayMyAlertMessage("Fields cannot be empty!!")
                return
        }
        else {
        ParseData.RetrieveDataForSearch( numOccupant.text, numLuggage: numLuggage.text, GoingFrom: GoingFrom.text, GoingTo: GoingTo.text ) {
            
            (StuffUser: Prefer) in
            self.stuffUser = StuffUser
            self.performSegueWithIdentifier("showPeople_Segue", sender: self)
            
            //(loggedUser: PUser) in
            //println(loggedUser)
            //self.loggedUser = loggedUser
            //self.performSegueWithIdentifier("showPeople", sender: self)
        }
    }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showPeople_Segue") {
            var childVC : searchList = segue.destinationViewController as searchList
            childVC.listuser = stuffUser.list
            childVC.login = login!
            
        }
            //childVC.prefer = //loggedUser.RetrieveUserFromClass()
        //    println("profile segue firing")
        if (segue.identifier == "UserActivity_Segue") {
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
            childVC.login = login!
            println("welcome to userActivity")
        }
        
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
