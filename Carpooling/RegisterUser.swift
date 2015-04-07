//
//  RegisterUser.swift
//  homework4
//
//  Created by uics7 on 2/27/15.
//  Copyright (c) 2015 uics7. All rights reserved.
//

import Foundation
import UIKit

class RegisterUser : UIViewController {
    
    
    
    @IBOutlet weak var registerUsernameTextField: UITextField!
    
    @IBOutlet weak var registerPasswordTextField: UITextField!
    
    
    @IBOutlet weak var registerCPasswordTextField: UITextField!
    
    
    func displayMyAlertMessage( userMessage: String)
    {
        var alert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert.addAction(ok);
        
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    
    @IBAction func registerButton(sender: AnyObject) {
        
        var new_user = PFObject(className:"User")
        new_user["email"] = registerUsernameTextField.text
        new_user["password"] = registerPasswordTextField.text
        new_user.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }

        
        
        let registerUsername = self.registerUsernameTextField.text;
        let registerPassword = self.registerPasswordTextField.text;
        let registerCPassword = self.registerCPasswordTextField.text;
        
        // check for empty fields
        
        if (registerUsername.isEmpty || registerPassword.isEmpty || registerCPassword.isEmpty){
            
            self.displayMyAlertMessage("All Fields mandatory");
            return;
        }
        
        //check for correct passwords
        
        if (registerPassword != registerCPassword){
            
            self.displayMyAlertMessage("Password do not match!!");
            
            return;
        }
        
        // store data
        //NSUserDefaults.standardUserDefaults().setObject(registerUsername, forKey: "registerUsername");
        //NSUserDefaults.standardUserDefaults().setObject(registerPassword, forKey: "registerPassword");
        //NSUserDefaults.standardUserDefaults().synchronize();
        
        // Alert message to confirm registration
        
        
        var alert = UIAlertController(title:"Alert", message:"Registration is Succesful!!", preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default){ action in
            self.dismissViewControllerAnimated(true, completion:nil);
        }
        alert.addAction(ok);
        
        self.presentViewController(alert, animated: true, completion: nil);
        
        
    }
        
    
    
       
}

}
