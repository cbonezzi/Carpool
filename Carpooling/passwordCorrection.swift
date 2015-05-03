//
//  passwordCorrection.swift
//  Carpooling
//
//  Created by Ruchika  on 5/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit

class passwordCorrection : UIViewController {
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    
    var alert = UIAlertView(title: "Alert", message: "password do not match!!", delegate: nil, cancelButtonTitle: "OK")
    
    var alert1 = UIAlertView(title: "Alert", message: "Your current password is wrong", delegate: nil, cancelButtonTitle: "OK")

   
    
    @IBOutlet weak var oldPassword: UITextField!
    
    @IBOutlet weak var repeatPassword: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!
    
    func displayMyAlertMessage()
    {
        alert.show()
        
    }
    
    func displayMyAlertMessage1()
    {
        alert1.show()
        
    }
    
    

    
    @IBAction func submit(sender: AnyObject) {
    
    
    if (self.repeatPassword.text != newPassword.text){
    self.displayMyAlertMessage()
    return
    
    }
    
    var emailPassed : String = login![0].email
    
    
    var user = PFQuery(className:"User")
    user.whereKey("user_email", equalTo:emailPassed)
    user.findObjectsInBackgroundWithBlock {
    (objects: [AnyObject]!, error: NSError!) -> Void in
    if error == nil {
    // The find succeeded.
        println("Successfully retrieved \(objects.count)objects")
    // Do something with the found objects
        if let objects = objects as? [PFObject] {
            for object in objects {
                var email : AnyObject = object.valueForKey("user_email")!
                var emailRetrieved  = email as String
                println("retirver id " + emailPassed)
    
                if (emailRetrieved == emailPassed){
                    var password : AnyObject = object.valueForKey("password")!
                    var passwordRetrieved = password as String
                    println(passwordRetrieved)
                    if (self.oldPassword.text != passwordRetrieved){
                            self.displayMyAlertMessage1()
    
    
                    }
                else {
    
                        self.ParseData.changePassword(emailPassed ,password : self.newPassword.text)
                    }
                }
            }
        }
    
        }
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