//
//  UserProfileInfoViewController.swift
//  Carpooling
//
//  Created by Aashay on 4/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class UserProfileInfoViewController: UIViewController, UITextViewDelegate {

      
    var usernameTable : [String]!
   
    var user_email : String = ""
    
    var objectid : String = ""
    
    @IBOutlet weak var picture: UIImageView!
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var genderLabel: UILabel!
    
    
    @IBOutlet weak var test: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet  var charRemainingLabel: UILabel! = UILabel()
    
    @IBOutlet weak var userProfileNameLabel: UILabel!
    @IBAction func sendNotification(sender: AnyObject) {
        
        // look into this for the notification docs to learn whether the installation is set to a particular object
        
        let message = textView.text
        var data = [ "title": "Some Title",
            "alert": message]
        
        var userQuery: PFQuery = PFInstallation.query()
        //var userQuery: PFQuery = PFUser.query()
        userQuery.whereKey("channels", equalTo: "channelName")
        userQuery.whereKey("objectId", equalTo: "SS9zXFLAdb")
        
        //query.whereKey("user_email", equalTo: userQuery)
        
        var push: PFPush = PFPush()
        push.setQuery(userQuery)
        push.setData(data)
        push.sendPushInBackground()
        //        let push = PFPush()
        //        push.setChannel("Giants")
        //        push.setMessage(textView.text)
        //        push.sendPushInBackground()
        
        
    }
    
    func textView(textView: UITextView!,
        shouldChangeTextInRange range: NSRange,
        replacementText text: String!) -> Bool{
            
            var newLength:Int = (textView.text as NSString).length + (text as NSString).length - range.length
            var remainingChar:Int = 140 - newLength
            
            charRemainingLabel.text = "\(remainingChar)"
            
            return (newLength > 140) ? false : true
    }
    
    
    
    

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userProfileNameLabel.text = user_email
        textView.layer.borderColor = UIColor.blackColor().CGColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5
        textView.delegate = self
        
        textView.becomeFirstResponder()

        println("in the user profile")
         println(user_email)
        
        //self.loadImageFromParse()
        var user = PFQuery(className:"User")
        user.whereKey("user_email", equalTo: user_email)
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
                        println("retirver id " + self.user_email)
                        
                        if (emailRetrieved == self.user_email){
                            self.objectid  = object.objectId
                            println(self.objectid)
                            let userImageFile = object["image"] as PFFile!
                            userImageFile.getDataInBackgroundWithBlock {
                                (imageData: NSData!, error: NSError!) -> Void in
                                if error == nil {
                                    if let imageData = imageData{
                                        let image = UIImage(data: imageData)
                                        println(image)
                                        self.picture.image = image
                                        //self.view.addSubview(self.picture)
                                    }
                            
                                    }
                                
                            var username : AnyObject = object.valueForKey("user_email")!
                            var usernameRetrieved = username as String
                            println(usernameRetrieved)
                            self.usernameLabel.text = usernameRetrieved
                            var age : AnyObject = object.valueForKey("age")!
                            var ageRetrieved = age as String
                            println(ageRetrieved)
                            self.ageLabel.text = ageRetrieved
                            var gender : AnyObject = object.valueForKey("gender")!
                            println(gender)
                            var genderRetrieved = gender[0] as String
                            self.genderLabel.text = genderRetrieved
                            
                        }
                    }
                }
            }
            }

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//check


}
