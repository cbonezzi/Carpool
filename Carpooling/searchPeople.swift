//
//  searchPeople.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class searchPeople: UIViewController, UIAlertViewDelegate {
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    var temp = 0
    var Role: String = ""
    //var alert = UIAlertController(title:"Alert", message:"Fields cannot be empty!!", preferredStyle: UIAlertControllerStyle.Alert)
    var alert = UIAlertView(title: "Alert", message: "Field connot be empty", delegate: nil, cancelButtonTitle: "OK")
    
    var alert1 = UIAlertView(title: "Alert", message: "No user found", delegate: nil, cancelButtonTitle: "OK")
    
    @IBOutlet weak var smokingSelection: UISegmentedControl!
    
    @IBOutlet weak var numOccupant: UITextField!
    @IBOutlet weak var numLuggage: UITextField!
    @IBOutlet weak var GoingFrom: UITextField!
    @IBOutlet weak var GoingTo: UITextField!
    
    var loggedUser2 : PUser!
    var stuffUser : Prefer!
    //var searchUserList : SearchUsers!
    @IBAction func RoleSegment(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
             Role = "Driver"
            temp = 1
        }
        else if sender.selectedSegmentIndex == 1 {
             Role = "Passenger"

                     temp = 2
        }

    }
    
    func displayMyAlertMessage1()
    {
        //var alert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        //alert.addButtonWithTitle("ok")
        alert1.show()
        
        //alert.addAction(ok);
        
        //self.(alertView: alert, clickedButtonAtIndex: 0)
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    

    
    
    func displayMyAlertMessage()
    {
        //var alert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        //alert.addButtonWithTitle("ok")
        alert.show()
        
        //alert.addAction(ok);
        
        //self.(alertView: alert, clickedButtonAtIndex: 0)
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    
    
    
    @IBAction func gobackPressed(sender: UIButton) {
         self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    @IBAction func search(sender: AnyObject) {
        
        if (numOccupant.text.isEmpty || numLuggage.text.isEmpty
        || GoingFrom.text.isEmpty || GoingTo.text.isEmpty || Role.isEmpty) {
    
            self.displayMyAlertMessage()
                return
        }
        
        else {
            ParseData.RetrieveDataForSearch(numOccupant.text, numLuggage: numLuggage.text, Role1 : Role ,GoingFrom: GoingFrom.text, GoingTo: GoingTo.text ) {
            
            (StuffUser: Prefer) in
            self.stuffUser = StuffUser
            if (self.stuffUser.email != nil) {
                println("in if")
            self.performSegueWithIdentifier("showPeople_Segue", sender: self)
                }
                else {
                println("in else")
                    self.displayMyAlertMessage1()
                }
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
            if(login != nil){
                childVC.login = login!
            }
            println("welcome to userActivity")
        }
        
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            //alert.show()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }
