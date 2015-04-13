//
//  FourthViewController.swift
//  Pool-IT
//
//  Created by Aashay on 2/20/15.
//  Copyright (c) 2015 Aashay. All rights reserved.
//

import UIKit
import Parse

class PreferencesViewController: UIViewController , UIAlertViewDelegate  {
    
    @IBOutlet weak var userlabel: UILabel!
    
    var localGender = 0
    var temp = 0
    var temp1 = 0
    var temp2 = 0
    var sliderValue = 0
    var smoker : String = "Yes"
    var gender : String = " Male"
    var role : String = "Driver"
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    
    
    //    @IBOutlet weak var ageGroupRangeLabel: UILabel!
    //
    //    @IBOutlet weak var ageGroupSlider: UISlider!
    
    
    
    //    @IBAction func valueChangeOfSlider(sender: AnyObject) {
    //
    //        var currentValue = Int(ageGroupSlider.value)
    //        ageGroupRangeLabel.text = "\(currentValue)"
    //        sliderValue = currentValue
    //    }
    
    var alert = UIAlertView(title:"Alert", message:"Fields cannot be empty", delegate : nil , cancelButtonTitle : "OK")
    
    @IBOutlet weak var min_age: UITextField!
    @IBOutlet weak var max_age: UITextField!
    
    @IBOutlet weak var NumOfOccupantsTextField: UITextField!
    
    @IBOutlet weak var luggageTextField: UITextField!
    
    @IBOutlet weak var musicPreferenceTextField:
    UITextField!
    
    @IBOutlet weak var GoingFrom: UITextField!
    
    @IBOutlet weak var GoingTo: UITextField!
    
    @IBAction func Date(sender: UIDatePicker) {
        
        var date = sender.date
    }
    
    @IBAction func smokerSegmentedControl(sender: AnyObject) {
        var new_user = PFObject(className: "Preferences")
        
        if sender.selectedSegmentIndex == 0 {
            new_user.addObject(("Yes"), forKey: "Smoker")
            temp1 = 1
            smoker = "yes"
        }
        else if sender.selectedSegmentIndex == 1 {
            new_user.addObject(("No"), forKey: "Smoker")
            temp1 = 2
            smoker = "No"
        }
        
        
    }
    
    @IBAction func genderSegmentedControl(sender: UISegmentedControl) {
        var new_user = PFObject(className: "Preferences")
        
        if sender.selectedSegmentIndex == 0 {
            new_user.addObject(("Male"), forKey: "gender")
            temp = 1
            gender = "Male"
        }
        else if sender.selectedSegmentIndex == 1 {
            new_user.addObject(("Female"), forKey: "gender")
            temp = 2
            gender = "Female"
        }
        else if sender.selectedSegmentIndex == 2 {
            new_user.addObject(("Unspecified"), forKey: "gender")
            temp = 3
            gender = "Unspecified"
        }
    }
    
    
    @IBAction func roleSegmentedControl(sender: UISegmentedControl) {
        
         var new_user = PFObject(className: "Preferences")
        
        if sender.selectedSegmentIndex == 0 {
            new_user.addObject(("Driver"), forKey: "role")
            temp2 = 1
            role = "Driver"
        }
        else if sender.selectedSegmentIndex == 1 {
            new_user.addObject(("Passenger"), forKey: "role")
            temp2 = 2
            role = "Passenger"
        }

    }
    
    func displayMyAlertMessage()
    {
        
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert.show();
        
        //self.presentViewController(alert, animated: true, completion: nil);
    }

    
    
    @IBAction func Goback(sender: AnyObject) {
        self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
        
    }
    
    @IBAction func submitPressed(sender: AnyObject) {
        
        if (musicPreferenceTextField.text.isEmpty || NumOfOccupantsTextField.text.isEmpty || luggageTextField.text.isEmpty || GoingFrom.text.isEmpty || GoingTo.text.isEmpty || min_age.text.isEmpty || max_age.text.isEmpty || smoker.isEmpty || gender.isEmpty || role.isEmpty){
            print("in the if")
            self.displayMyAlertMessage()
        }

        else {
        var new_user = PFObject(className: "Preferences")
       
        new_user["music_taste"] = musicPreferenceTextField.text
        new_user["occupants"] = NumOfOccupantsTextField.text
        new_user["luggage"] = luggageTextField.text
        new_user["GoingFrom"] = GoingFrom.text
        new_user["GoingTo"] = GoingTo.text
        new_user["min_age"] = min_age.text
        new_user["max_age"] = max_age.text
        
        if ( temp == 1 ) {
            new_user.addObject(("Male"), forKey: "gender")
        }
        else if ( temp == 2 ) {
            new_user.addObject(("Female"), forKey: "gender")
        }
        else if ( temp == 3 ) {
            new_user.addObject(toString("Unspecified"), forKey: "gender")
        }
        
              if ( temp1 == 1 ) {
            new_user.addObject(("Yes"), forKey: "Smoker")
        }
        else if ( temp1 == 2 ) {
            new_user.addObject(("No"), forKey: "Smoker")
        }
        
        if ( temp2 == 1 ) {
            new_user.addObject(("Driver"), forKey: "role")
        }
        else if ( temp2 == 2 ) {
            
            new_user.addObject(("Rider"), forKey: "role")
        }
        new_user.saveInBackgroundWithBlock {
            (success: Bool, error: NSError!) -> Void in
            if (success) {
                print("success")
                // The object has been saved.
            } else {
                print("error")
                // There was a problem, check error.description
            }
            }
        }
    }
    
    
    // var LoginView: UIView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "UserActivity_Segue") {
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
            childVC.login = login!
            println("welcome to userActivity")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userlabel.text! = login![0].email
        println("Preference View Controller !!!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
}

