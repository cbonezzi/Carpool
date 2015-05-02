//
//  GetStartedController.swift
//  Carpooling
//
//  Created by Cesar on 3/12/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit

class GetStartedViewController: UIViewController {
    
    @IBOutlet var GSWPI: UILabel!
    @IBOutlet var tf: UITextField!
    @IBAction func SignupPressed(sender: UIButton) {
        self.performSegueWithIdentifier("Signup_Segue", sender: self)
    }
    
    @IBAction func loginPressed(sender: UIButton) {
        self.performSegueWithIdentifier("Login_Segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Login_Segue") {
            var childVC : LoginViewController = segue.destinationViewController as LoginViewController
            //childVC.User1 = loggedUser.RetrieveUserFromClass()
            println("Loginview segue firing")
        }
        if (segue.identifier == "Signup_Segue") {
            var childVC2 : SignupViewController = segue.destinationViewController as SignupViewController
            //var childVC2 : LoginViewController = segue.destinationViewController as LoginViewController
            println("segue2 firing")
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