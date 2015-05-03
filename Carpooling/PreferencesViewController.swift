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
    var alert1 = UIAlertView(title:"Alert1", message:"Occupants must be a number", delegate : nil , cancelButtonTitle : "OK")
    var alert2 = UIAlertView(title:"Alert2", message:"Luggage must be a number", delegate : nil , cancelButtonTitle : "OK")
    var alert3 = UIAlertView(title:"Alert3", message:"Min Age must be a number", delegate : nil , cancelButtonTitle : "OK")
    var alert4 = UIAlertView(title:"Alert4", message:"Max Age must be a number", delegate : nil , cancelButtonTitle : "OK")
    var alert5 = UIAlertView(title:"Alert5", message:"Preferences Updated", delegate : nil , cancelButtonTitle : "OK")
    
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

    func displayMyAlertMessage1()
    {
    
    
    //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
    
    alert1.show();
    
    //self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func displayMyAlertMessage2()
    {
        
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert2.show();
        
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func displayMyAlertMessage3()
    {
        
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert3.show();
        
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func displayMyAlertMessage4()
    {
        
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert4.show();
        
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func displayMyAlertMessage5()
    {
        
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert5.show();
        
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
            
            var new_pref = PFObject(className:"Preferences")
            var smokeArray = [smoker]
            var gendArray = [gender]
            var roleArray = [role]
            new_pref["user_email"] = login![0].email
            new_pref["music_taste"] = self.musicPreferenceTextField.text;
            new_pref["Smoker"] = smokeArray
            new_pref["gender"] = gendArray
            new_pref["role"] = roleArray
            new_pref["occupants"] = self.NumOfOccupantsTextField.text;
            new_pref["luggage"] = self.luggageTextField.text;
            new_pref["GoingTo"] = self.GoingTo.text;
            new_pref["GoingFrom"] = self.GoingFrom.text;
            new_pref["min_age"] = self.min_age.text;
            new_pref["max_age"] = self.max_age.text;
            
            let numoc = self.NumOfOccupantsTextField.text;
            let lugg = self.luggageTextField.text;
            let minage = self.min_age.text;
            let maxage = self.max_age.text;
            
            if let match = numoc.rangeOfString("^[0-9]*$", options: .RegularExpressionSearch) {
                if let match = lugg.rangeOfString("^[0-9]*$", options: .RegularExpressionSearch) {
                    if let match = minage.rangeOfString("^[0-9]*$", options: .RegularExpressionSearch) {
                        if let match = maxage.rangeOfString("^[0-9]*$", options: .RegularExpressionSearch) {
                        
                            new_pref.saveInBackgroundWithBlock {
                                (success: Bool, error: NSError!) -> Void in
                                if (success) {
                                    // The object has been saved.
                                    self.displayMyAlertMessage5();
                                } else {
                                    // There was a problem, check error.description
                                }
                            }

                        
                        } else {
                            self.displayMyAlertMessage4();
                            return;
                        }
                    } else {
                        self.displayMyAlertMessage3();
                        return;
                    }
                } else {
                    self.displayMyAlertMessage2();
                    return;
                }
            } else {
                self.displayMyAlertMessage1();
                
                return;
            }
        }
    }
    
    
    // var LoginView: UIView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "UserActivity_Segue") {
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
             if(login != nil){
                childVC.login = login!
            }
            println("welcome to userActivity")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(login != nil){
            userlabel.text! = login![0].email
        }
        
        println("Preference View Controller !!!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
}

