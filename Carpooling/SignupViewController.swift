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
    var ParseData : ParseModel = ParseModel()
    
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
    var alert = UIAlertView(title: "Alert", message: "Please fill all fields", delegate: nil, cancelButtonTitle: "OK")
    
    var alert1 = UIAlertView(title: "Alert", message: "Confirm Password does not match Password", delegate: nil, cancelButtonTitle: "OK")
    
    var alert2 = UIAlertView(title: "Alert", message: "Username needs to be an email address.", delegate: nil, cancelButtonTitle: "OK")
    
    func displayMyAlertMessage()
    {
        
        
        alert.show();
        
        
    }
    
    func displayMyAlertMessage1()
    {
        
        
        alert1.show();
        
        
    }
    
    func displayMyAlertMessage2()
    {
        
        
        alert2.show();
        
        
    }


    
    @IBAction func registerButton(sender: AnyObject) {
        
        var new_user = PFObject(className:"User")
        var new_preference = PFObject(className: "Preferences")
        new_user["user_email"] = registerUsernameTextField.text
        new_user["password"] = registerPasswordTextField.text
        new_preference["user_email"] = registerUsernameTextField.text
        //new_user["password"] = registerPasswordTextField.text
            
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
            
            //if !(Regex("/^[a-z].*[@][a-z]*[.](com|edu)/i").test(registerUsername)) {
                
                //self.displayMyAlertMessage2("Username needs to be an email address.");
            
                //return;
            
           // }
            
            if let match = registerUsername.rangeOfString("^[a-z].*[@][a-z]*[.](com|edu)$", options: .RegularExpressionSearch) {
                
            } else {
                self.displayMyAlertMessage2();
                
                return;
            }
        
                new_user.saveInBackgroundWithBlock {
                (success_user: Bool, error: NSError!) -> Void in
                    //PFFile(name:"image.jpg", data:imageData)
                    if (success_user) {
                        // The object has been saved.
                    } else {
                        // There was a problem, check error.description
                    }
                
                
                new_preference.saveInBackgroundWithBlock {
                    (success_pref: Bool, error: NSError!) -> Void in
                    if (success_pref) {
                        
                    } else {
                        
                    }
                }
                
                //var user_name_arr : [String] = Array.self[0]
                //user_name_arr.append(registerUsername)
                let currentInstallation = PFInstallation.currentInstallation()
                currentInstallation.addUniqueObject(registerUsername, forKey:  "Users")
                currentInstallation.saveInBackground()
            
            // Alert message to confirm registration
            
            var alert = UIAlertController(title:"Alert", message:"Registration is Succesful\n Now login and set preferences for your trip.", preferredStyle: UIAlertControllerStyle.Alert)
            
            let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion:nil);
            }
            alert.addAction(ok);
            
            self.presentViewController(alert, animated: true, completion: nil);
            
            
            }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //add try-catch block, move elsewhere, add things to deal with?
        registerUsernameTextField.delegate = self
        registerPasswordTextField.delegate = self
        registerCPasswordTextField.delegate = self
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        //return
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
    
}
