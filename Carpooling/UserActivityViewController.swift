//
//  UserActivityViewController.swift
//  Carpooling
//
//  Created by Cesar on 3/15/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit

class UserActivityViewController: UIViewController {
    var login : [Login]!
    var loggedUser1 : LoginUser!
    @IBOutlet weak var usernameLabel: UILabel!
    // needs to be optional
    
    
    
    @IBAction func SearchPressed(sender: UIButton) {
        
        self.performSegueWithIdentifier("SearchPeople_Segue", sender: self)
        
        
    }
    
    @IBAction func NotificationPressed(sender: UIButton) {
        self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    @IBAction func PreferencesPressed(sender: UIButton) {
        self.performSegueWithIdentifier("Preferences_Segue", sender: self)
    }
    @IBAction func ProfilePressed(sender: UIButton) {
        self.performSegueWithIdentifier("Profile_Segue", sender: self)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "SearchPeople_Segue") {
            var childVC : searchPeople = segue.destinationViewController as searchPeople
            childVC.login = login
            println("welcome to search people")
        }
        if (segue.identifier == "Preferences_Segue") {
            var childVC2 : PreferencesViewController = segue.destinationViewController as PreferencesViewController
            childVC2.login = login//logg.RetrieveUserFromClass()
            println("welcome to preferences")
        }
        if (segue.identifier == "Profile_Segue") {
            var childVC : ProfileViewController = segue.destinationViewController as ProfileViewController
            childVC.login = login
            println("welcome to Profile")
        }
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameLabel.text! = login![0].email
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
