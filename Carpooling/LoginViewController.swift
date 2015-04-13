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
    var alert = UIAlertView(title: "Alert", message: "Field connot be empty", delegate: nil, cancelButtonTitle: "OK")
    
    func segueCalled(){
        println("buton clicked Segue Fired")
    }
    
    @IBOutlet var LoginView: UIView!
    
    func displayMyAlertMessage()
    {
                alert.show();
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    
   
    
    @IBAction func loginButton(sender: AnyObject) {
        
        if (loginUsernameTextField.text.isEmpty || loginPasswordTextField.text.isEmpty){
            
            self.displayMyAlertMessage();
            
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
            if(login != nil) {
            childVC.login = loggedUser1.RetrieveUserFromClass()
            self.segueCalled();
            }
            println("welcome to user activity")
        }
        if (segue.identifier == "Signup_Segue") {
            var childVC2 : SignupViewController = segue.destinationViewController as SignupViewController
            //var childVC2 : LoginViewController = segue.destinationViewController as LoginViewController
            self.segueCalled();
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