//
//  FirstViewController.swift
//  Pool-IT
//
//  Created by Aashay on 2/20/15.
//  Copyright (c) 2015 Aashay. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    @IBAction func PressedStart(sender: UIButton) {
    
        self.performSegueWithIdentifier("Start_Segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "Start_Segue") {
            var childVC : GetStartedViewController = segue.destinationViewController as GetStartedViewController
            //childVC.User1 = loggedUser.RetrieveUserFromClass()
            println("profile segue firing")
        }
        if (segue.identifier == "Register_Segue") {
            //var childVC2 : SignupController = segue.destinationViewController as SignupController
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

