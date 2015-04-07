//
//  ConnectViewController.swift
//  Carpooling
//
//  Created by Cesar on 2/18/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
   
    var temp = 0
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    
    
    @IBOutlet var age: UITextField!
    @IBOutlet var username: UITextField!
    
    @IBAction func gobackPressed(sender: UIButton) {
        self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    
    
    
    @IBAction func genderSegmentedControl(sender: AnyObject) {
    

        var new_user = PFObject(className: "userInfo")
        
        if sender.selectedSegmentIndex == 0 {
           // new_user.addObject(("Male"), forKey: "gender")
            temp = 1
        }
        else if sender.selectedSegmentIndex == 1 {
            //new_user.addObject(("Female"), forKey: "gender")
            temp = 2
        }
        else if sender.selectedSegmentIndex == 2 {
            //new_user.addObject(("Unspecified"), forKey: "gender")
            temp = 3
        }

    }

    @IBAction func Submit(sender: AnyObject) {
        
        var new_user = PFObject(className: "userInfo")

        new_user["username"] = username.text
        new_user["age"] = age.text
        
        if ( temp == 1 ) {
            new_user.addObject(("Male"), forKey: "gender")
        }
        else if ( temp == 2 ) {
            new_user.addObject(("Female"), forKey: "gender")
        }
        else if ( temp == 3 ) {
            new_user.addObject(toString("Unspecified"), forKey: "gender")
        }
        
        
        new_user.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                // The object has been saved.
                print("Success")
            } else {
                // There was a problem, check error.description
                print("error")
            }
        }
}

 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "UserActivity_Segue") {
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
            childVC.login = login!
            println("welcome to userActivity")
        }

}

 override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    println("Profile View Controller !!!!")
}

override func didReceiveMemoryWarning() {
   super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}



}




