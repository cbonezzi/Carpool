//
//  SignupViewController.swift
//  Carpooling
//
//  Created by Ruchika  on 3/7/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        var error: NSError?
        self.internalExpression = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error)!
    }
    
    func test(input: String) -> Bool {
        let matches = self.internalExpression.matchesInString(input, options: nil, range:NSMakeRange(0, countElements(input)))
        return matches.count > 0
    }
}

class SignupViewController : UIViewController, UITextFieldDelegate {
    
    
    
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
        new_user["user_email"] = registerUsernameTextField.text
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
            
            //if !(Regex("/^[a-z].*[@][a-z]*[.](com|edu)/i").test(registerUsername)) {
                
                //self.displayMyAlertMessage("Username needs to be an email address.");
            
                //return;
            
           // }
            
            let match = registerUsername.rangeOfString("/^[a-z].*[@][a-z]*[.](com|edu)/i", options: .RegularExpressionSearch);
            
            if (match == nil) {
                self.displayMyAlertMessage("Username needs to be email.");
                return;
            }
            
            // Alert message to confirm registration
            
            var alert = UIAlertController(title:"Alert", message:"Registration is Succesful!!", preferredStyle: UIAlertControllerStyle.Alert)
            
            let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion:nil);
            }
            alert.addAction(ok);
            
            self.presentViewController(alert, animated: true, completion: nil);
            
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //add try-catch block, move elsewhere, add things to deal with?
        //self.registerUsernameTextField.delegate = self
        //self.registerPasswordTextField.delegate = self
        //self.registerCPasswordTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
}
