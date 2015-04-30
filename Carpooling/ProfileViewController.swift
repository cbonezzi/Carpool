//
//  ConnectViewController.swift
//  Carpooling
//
//  Created by Cesar on 2/18/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController ,UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    var temp = 0
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    
    
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet var age: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet weak var reenterPassword: UITextField!
    // alert for passwordMatch
    var alert = UIAlertView(title: "Alert", message: "password do not match!!", delegate: nil, cancelButtonTitle: "OK")
    
    var alert1 = UIAlertView(title: "Alert", message: "Your current password is wrong", delegate: nil, cancelButtonTitle: "OK")
    
    @IBAction func gobackPressed(sender: UIButton) {
        self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    
    
    var imageProfile : PFFile!
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        //self.imagePicker
    }
    
    // retrieving and matching right passwords
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker : UIImagePickerController = UIImagePickerController()
    
    
    
    
    @IBAction func uploadImage(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("buttom captured")
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            imagePicker.allowsEditing = false
            self.presentViewController(imagePicker, animated : true, completion : nil)
        }
        
        
        
    }
    
    
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info : [NSObject : AnyObject]!)  {
        var  emailF: String!
        
        var userloggedin : String = login![0].email
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        let imageData = UIImageJPEGRepresentation(image, 0.05)
        print(imageData)
        imageProfile = PFFile(name:"image.jpg", data:imageData)
        imageView.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    @IBAction func genderSegmentedControl(sender: AnyObject) {
        
        
        var new_user = PFObject(className: "userInfo")
        
        if sender.selectedSegmentIndex == 0 {
            // new_user.addObject(("Male"), forKey: "gender")
            temp = 1
        }
        else if sender.selectedSegmentIndex == 1 {
            //new_user.addObject(("Female"), forKey: "gender")
            temp = 2
        }
        else if sender.selectedSegmentIndex == 2 {
            //new_user.addObject(("Unspecified"), forKey: "gender")
            temp = 3
        }
        
    }
    
    func displayMyAlertMessage()
    {
        alert.show()
        
    }
    
    func displayMyAlertMessage1()
    {
        alert1.show()
        
    }
    
    
    
    @IBAction func Submit(sender: AnyObject) {
        
        var  age1 = self.age.text
        print(age1)
        var  username1 = self.username.text
        var password1 = self.newPassword.text
        var gender1: [String]!
        if ( self.temp == 1 ) {
            gender1 = ["Male"]
        }
        else if ( self.temp == 2 ) {
            gender1 = ["Female"]        }
        else if ( self.temp == 3 ) {
            gender1 = ["Unspecified"]
            
        }
        if (self.reenterPassword.text != newPassword.text){
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
                                
                                self.ParseData.uploadProfileImage(self.imageProfile, emailRetrieved :emailPassed , age: self.age.text , username: self.username.text, password : self.newPassword.text, gender : gender1)
                            }
                    }
                }
            }
         
            }}}
    
    
    
    
    
    //        var new_user = PFObject(className: "userInfo")
    //
    //        new_user["username"] = username.text
    //        new_user["age"] = age.text
    //
    //        if ( temp == 1 ) {
    //            new_user.addObject(("Male"), forKey: "gender")
    //        }
    //        else if ( temp == 2 ) {
    //            new_user.addObject(("Female"), forKey: "gender")
    //        }
    //        else if ( temp == 3 ) {
    //            new_user.addObject(toString("Unspecified"), forKey: "gender")
    //        }
    //
    //
    //        new_user.saveInBackgroundWithBlock {
    //            (success: Bool, error: NSError!) -> Void in
    //            if (success) {
    //                // The object has been saved.
    //                print("Success")
    //            } else {
    //                // There was a problem, check error.description
    //                print("error")
    //            }
    //        }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "UserActivity_Segue") {
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
            if(login != nil){
                childVC.login = login!
                println("welcome to userActivity")
            }}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("Profile View Controller !!!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

