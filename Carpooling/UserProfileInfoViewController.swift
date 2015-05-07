//
//  UserProfileInfoViewController.swift
//  Carpooling
//
//  Created by Aashay on 4/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class UserProfileInfoViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate{

    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    var usernameTable : [String]!
    var prefer : [Prefer]?
    var listuser : [String]!
    var CurrentLocation : LocationInfo!
   
    var user_email : String = ""
    
    var objectid : String = ""
    
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var smokerLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var musicLabel: UILabel!
    
    @IBOutlet weak var test: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet  var charRemainingLabel: UILabel! = UILabel()
    
    @IBOutlet weak var userProfileNameLabel: UILabel!
    
    
    @IBAction func gobackPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("gobackPressedToSearchList_segue", sender: self) 
    }
    
    override  func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "gobackPressedToSearchList_segue"){
            var childVC : searchList = segue.destinationViewController as searchList
            if(login != nil){
                childVC.login = login!
                childVC.listuser = listuser
                childVC.CurrentLocation = CurrentLocation
            }
            println("Welcome to userActivity")
        }
  
    }
    
    // replying to another user could be simple as creating or tapping into the received notification and carrying 
    // the user login or email of that person on the notification...we can try to complete this step as follows
    // 1. take note of the user in contact 
    // 2. and attach initiator login id/ object id which is associated with the device within the notification
    // 3. open a link between the two by adding a reply button on the notification pop-up
    // 4. we get notification reply
    @IBAction func sendNotification(sender: AnyObject) {
        
        // look into this for the notification docs to learn whether the installation is set to a particular object
        
        let message = textView.text
        var data = [ "title": "Some Title",
            "alert": message]
        
        var userQuery: PFQuery = PFInstallation.query()
        //var userQuery: PFQuery = PFUser.query()
        userQuery.whereKey("Users", equalTo: user_email)
        //userQuery.whereKey("objectId", equalTo: "LT9lqlcRKs")
        
        //query.whereKey("user_email", equalTo: userQuery)
        
        var push: PFPush = PFPush()
        push.setQuery(userQuery)
        push.setData(data)
        push.sendPushInBackground()
        
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        //return
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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green.jpg")!)
        self.userProfileNameLabel.text = user_email
        textView.layer.borderColor = UIColor.blackColor().CGColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5
        textView.delegate = self
        
        textView.becomeFirstResponder()
        
        println("in the user profile")
        println(user_email)
        var user1 = PFQuery(className:"Preferences")
        user1.whereKey("user_email", equalTo: user_email)
        user1.findObjectsInBackgroundWithBlock {
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
                            var username : AnyObject = object.valueForKey("user_email")!
                            var usernameRetrieved = username as String
                            println(usernameRetrieved)
                            
                            var smoker : AnyObject = object.valueForKey("Smoker")!
                            var smokerRetrieved = smoker[0] as String
                            println(smokerRetrieved)
                            self.smokerLabel.text = smokerRetrieved
                            var music : AnyObject = object.valueForKey("music_taste")!
                            println(music)
                            var musicRetrieved = music as String
                            self.musicLabel.text = musicRetrieved
                            
                        }
                    }
                }
            }
        }
        
        
        
        
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
                            
                            if let userImageFile = object["image"] as PFFile! {
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
