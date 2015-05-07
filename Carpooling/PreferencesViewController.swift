//
//  FourthViewController.swift
//  Pool-IT
//
//  Created by Aashay on 2/20/15.
//  Copyright (c) 2015 Aashay. All rights reserved.
//

import UIKit
import Parse

class PreferencesViewController: UIViewController , UIAlertViewDelegate , UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var userlabel: UILabel!
    
    var localGender = 0
    var temp = 0
    var temp1 = 0
    var temp2 = 0
    var sliderValue = 0
    var smoker : [String] = ["Yes"]
    var gender : [String] = [" Male"]
    var role : [String] = ["Driver"]
    var selectState1: String!
    var selectState2: String!
    var row : Int = 0
    var component : Int = 0
    var row1 : Int = 0
    var component1 : Int = 0
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myPicker2: UIPickerView!
    let pickerData = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
        "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
        "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
        "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
        "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    let pickerData2 = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
        "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
        "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
        "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
        "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    
    @IBOutlet weak var datepicker: UIDatePicker!
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    var email : String!
    func picker(){
        datepicker.transform = CGAffineTransformMakeScale(0.8, 0.6)
        datepicker.setValue(UIColor.whiteColor(), forKey: "textColor")
    }
    func pickerSourceSt(){
        myPicker.transform = CGAffineTransformMakeScale(0.8, 0.6)
        myPicker.setValue(UIColor.whiteColor(), forKey: "textColor")
    }
    func pickerdestinationSt(){
        myPicker2.transform = CGAffineTransformMakeScale(0.8, 0.6)
        myPicker2.setValue(UIColor.whiteColor(), forKey: "textColor")
    }
    
    var alert = UIAlertView(title:"Alert", message:"Fields cannot be empty", delegate : nil , cancelButtonTitle : "OK")
    var alert1 = UIAlertView(title:"Alert1", message:"Occupants must be a number", delegate : nil , cancelButtonTitle : "OK")
    var alert2 = UIAlertView(title:"Alert2", message:"Luggage must be a number", delegate : nil , cancelButtonTitle : "OK")
    var alert3 = UIAlertView(title:"Alert3", message:"Min Age must be a number", delegate : nil , cancelButtonTitle : "OK")
    var alert4 = UIAlertView(title:"Alert4", message:"Max Age must be a number", delegate : nil , cancelButtonTitle : "OK")
    
    
    @IBOutlet weak var min_age: UITextField!
    @IBOutlet weak var max_age: UITextField!
    
    @IBOutlet weak var NumOfOccupantsTextField: UITextField!
    
    @IBOutlet weak var luggageTextField: UITextField!
    
    @IBOutlet weak var musicPreferenceTextField:
    UITextField!
    
    @IBOutlet weak var GoingFrom: UITextField!
    
    @IBOutlet weak var GoingTo: UITextField!
    
    @IBAction func smokerSegmentedControl(sender: AnyObject) {
        var new_user = PFObject(className: "Preferences")
        
        if sender.selectedSegmentIndex == 0 {
            new_user.addObject(("Yes"), forKey: "Smoker")
            temp1 = 1
            smoker = ["yes"]
        }
        else if sender.selectedSegmentIndex == 1 {
            new_user.addObject(("No"), forKey: "Smoker")
            temp1 = 2
            smoker = ["No"]
        }
        
        
    }
    
    @IBAction func genderSegmentedControl(sender: UISegmentedControl) {
        var new_user = PFObject(className: "Preferences")
        
        if sender.selectedSegmentIndex == 0 {
            new_user.addObject(("Male"), forKey: "gender")
            temp = 1
            gender = ["Male"]
        }
        else if sender.selectedSegmentIndex == 1 {
            new_user.addObject(("Female"), forKey: "gender")
            temp = 2
            gender = ["Female"]
        }
        else if sender.selectedSegmentIndex == 2 {
            new_user.addObject(("Unspecified"), forKey: "gender")
            temp = 3
            gender = ["Unspecified"]
        }
    }
    
    
    @IBAction func roleSegmentedControl(sender: UISegmentedControl) {
        
        var new_user = PFObject(className: "Preferences")
        
        if sender.selectedSegmentIndex == 0 {
            new_user.addObject(("Driver"), forKey: "role")
            temp2 = 1
            role = ["Driver"]
        }
        else if sender.selectedSegmentIndex == 1 {
            new_user.addObject(("Passenger"), forKey: "role")
            temp2 = 2
            role = ["Passenger"]
        }

    }
    
    func displayMyAlertMessage()
    {
        alert.show();
    }

    func displayMyAlertMessage1()
    {
        alert1.show();
    }
    
    func displayMyAlertMessage2()
    {
        alert2.show();
    }
    
    func displayMyAlertMessage3()
    {
        alert3.show();
    }
    
    func displayMyAlertMessage4()
    {
        alert4.show();
    }
    
    @IBAction func Goback(sender: AnyObject) {
        self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        var currentStateString : String = String()
        
        if (pickerView.tag == 1){
            selectState1 = pickerData[row]
            currentStateString = selectState1
        }
        if (pickerView.tag == 2){
            selectState2 = pickerData[row]
            currentStateString = selectState2
        }
        println(currentStateString)

        
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData[row]
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blueColor()])
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        var pickerLabel = view as UILabel!
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            
            //color  and center the label's background
            let hue = CGFloat(row)/CGFloat(pickerData.count)
            pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
            pickerLabel.textAlignment = .Center
            
        }
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel!.attributedText = myTitle
        
        return pickerLabel
        
    }
    
    //size the components of the UIPickerView
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 75.0
    }
    
    @IBAction func submitPressed(sender: AnyObject) {
        
        let numoc = self.NumOfOccupantsTextField.text;
        let lugg = self.luggageTextField.text;
        let minage = self.min_age.text;
        let maxage = self.max_age.text;
        let music = self.musicPreferenceTextField.text
        var dateV =  self.datepicker.date
        var goingFrom = self.GoingFrom.text
        var goingto = self.GoingTo.text
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //format style. Browse online to get a format that fits your needs.
        var dateString = dateFormatter.stringFromDate(dateV)
        println(dateString)
        
        
        
        if let match = numoc.rangeOfString("^[0-9]+$", options: .RegularExpressionSearch) {
            if let match = lugg.rangeOfString("^[0-9]+$", options: .RegularExpressionSearch) {
                if let match = minage.rangeOfString("^[0-9]+$", options: .RegularExpressionSearch) {
                    if let match = maxage.rangeOfString("^[0-9]+$", options: .RegularExpressionSearch) {
                    } else {
                        self.displayMyAlertMessage4();
                        return
                    }
                } else {
                    self.displayMyAlertMessage3();
                    return
                }
            } else {
                self.displayMyAlertMessage2();
                return
            }
        } else {
            self.displayMyAlertMessage1();
            
            return;
        }
        
        if (musicPreferenceTextField.text.isEmpty || NumOfOccupantsTextField.text.isEmpty || luggageTextField.text.isEmpty || GoingFrom.text.isEmpty || GoingTo.text.isEmpty || min_age.text.isEmpty || max_age.text.isEmpty || smoker.isEmpty || gender.isEmpty || role.isEmpty){
            print("in the if")
            self.displayMyAlertMessage()
        }
            
        else{
            
           
            println(dateV)
            println(music)
            println(smoker)
            println(role)
            println(gender)
            print(selectState1)
            print(selectState2)
            
            println(goingFrom)
            println(goingto)
            ParseData.uploadDataPreferences(email , minAge : minage, maxAge: maxage, music: musicPreferenceTextField.text!, smoker : smoker , date : dateString, occupants : numoc , luggage : lugg, gender : gender, role : role, goingFrom: goingFrom ,goingTo : goingto, fromState : selectState1,  toState : selectState2)
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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
        picker()
        pickerdestinationSt()
        pickerSourceSt()
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker2.delegate = self
        myPicker2.dataSource = self
        
        min_age.delegate = self
        max_age.delegate = self
        NumOfOccupantsTextField.delegate = self
        luggageTextField.delegate = self
        musicPreferenceTextField.delegate = self
        GoingFrom.delegate = self
        GoingTo.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        if(login != nil){
            userlabel.text! = login![0].email
            email = login![0].email
        }        
        println("Preference View Controller !!!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
        //return
    }
    
    
  
    
}

