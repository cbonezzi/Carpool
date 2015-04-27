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
    
    
    @IBOutlet var age: UITextField!
    @IBOutlet var username: UITextField!
    
    @IBAction func gobackPressed(sender: UIButton) {
        self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    
    
    var imageProfile : PFFile!
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        //self.imagePicker
    }
    
    
    
    
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
    
   
    
    

    @IBAction func Submit(sender: AnyObject) {
        
        
        var emailPassed : String = login![0].email
        
        
        var  age1 = self.age.text
        var  username1 = self.username.text
        var gender1: String!
        if ( self.temp == 1 ) {
            gender1 = "Male"
        }
        else if ( self.temp == 2 ) {
            gender1 = "Female"        }
        else if ( self.temp == 3 ) {
            gender1 = "Unspecified"
        }
        

        
        
        ParseData.uploadProfileImage(imageProfile, emailRetrieved :emailPassed , age: age1 , username: username1)
        
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
}

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




