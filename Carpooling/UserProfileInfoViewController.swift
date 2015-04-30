//
//  UserProfileInfoViewController.swift
//  Carpooling
//
//  Created by Aashay on 4/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class UserProfileInfoViewController: UIViewController {

      
    var usernameTable : [String]!
   
    var user_email : String = ""
    
    var objectid : String = ""
    
    @IBOutlet weak var picture: UIImageView!
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    @IBOutlet weak var genderLabel: UILabel!
    
    
    @IBOutlet weak var test: UILabel!
    
  
//    func loadImageFromParse () {
//        
//        var query = PFQuery(className:"User")
//        query.whereKey("objectId", equalTo:"lCfdnErgCY")
//        query.findObjectsInBackgroundWithBlock {
//            (objects: [AnyObject]!, error: NSError!) -> Void in
//            if error == nil {
//                println("Successfully retrieved \(objects.count) records.")
//                for object in objects {
//                    let userImageFile = object["image"] as PFFile!
//                    userImageFile.getDataInBackgroundWithBlock {
//                        (imageData: NSData!, error: NSError!) -> Void in
//                        if error == nil {
//                            if let imageData = imageData{
//                                let image = UIImage(data: imageData)
//                                println(image)
//                                
//                            }
//                            
//                        }
//                    }
//                }
//                
//            } else {
//                NSLog("Error: %@ %@", error, error.userInfo!)
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
