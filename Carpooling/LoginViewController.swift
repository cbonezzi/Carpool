//
//  LoginViewController.swift
//  Carpooling
//
//  Created by uics7 on 3/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIkit

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var loginUsernameTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    
    @IBOutlet var LoginView: UIView!
    
    func displayMyAlertMessage( userMessage: String)
    {
        var alert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert.addAction(ok);
        
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    
    
    @IBAction func loginButton(sender: AnyObject) {
        
        if (loginUsernameTextField.text.isEmpty || loginPasswordTextField.text.isEmpty){
            
            self.displayMyAlertMessage("username and password cannot be empty!!");
            
        }
        
        
    ParseData.LoginUserbyEmail(loginUsernameTextField.text, password: loginPasswordTextField.text) {
            (loggedUser: LoginUser) in
            println(loggedUser)
            self.loggedUser1 = loggedUser
            self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
        }
    }
    @IBAction func registerPressed(sender: UIButton) {
        self.performSegueWithIdentifier("Signup_Segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "UserActivity_Segue") {
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
            childVC.login = loggedUser1.RetrieveUserFromClass()
            println("welcome to user activity")
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
        
        //self.loginUsernameTextField.delegate = self
        //self.loginPasswordTextField.delegate = self
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }
}