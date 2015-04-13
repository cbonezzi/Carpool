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

class SignupViewController : UIViewController, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var registerUsernameTextField: UITextField!
    
    @IBOutlet weak var registerPasswordTextField: UITextField!
    
    
    @IBOutlet weak var registerCPasswordTextField: UITextField!
    var alert = UIAlertView(title: "Alert", message: "Field connot be empty", delegate: nil, cancelButtonTitle: "OK")
    
     var alert1 = UIAlertView(title: "Alert", message: "Password do not match", delegate: nil, cancelButtonTitle: "OK")
    func displayMyAlertMessage()
    {
        
        
        alert.show();
        
        
    }
    func displayMyAlertMessage1()
    {
        
        
        alert1.show();
        
        
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
                
                self.displayMyAlertMessage();
                return;
            }
            
            //check for correct passwords
            
            if (registerPassword != registerCPassword){
                
                self.displayMyAlertMessage1();
                
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
