//
//  FourthViewController.swift
//  Pool-IT
//
//  Created by Aashay on 2/20/15.
//  Copyright (c) 2015 Aashay. All rights reserved.
//

import UIKit
import Parse

class PreferencesViewController: UIViewController , UIAlertViewDelegate , UIPickerViewDataSource, UIPickerViewDelegate  {
    
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
    
    @IBOutlet weak var datepicker: UIDatePicker!
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    
    
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
    var alert5 = UIAlertView(title:"Alert5", message:"Preferences Updated", delegate : nil , cancelButtonTitle : "OK")
    
    @IBOutlet weak var min_age: UITextField!
    @IBOutlet weak var max_age: UITextField!
    
    @IBOutlet weak var NumOfOccupantsTextField: UITextField!
    
    @IBOutlet weak var luggageTextField: UITextField!
    
    @IBOutlet weak var musicPreferenceTextField:
    UITextField!
    
    @IBOutlet weak var GoingFrom: UITextField!
    
    @IBOutlet weak var GoingTo: UITextField!
    
    //@IBAction func Date(sender: UIDatePicker) {
        
       // var date = sender.date
   // }
    
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
        
        
        
        
        alert3.show();
        
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func displayMyAlertMessage4()
    {
        
        
        //let ok = UIAlertAction(title: "OK", style:UIAlertActionStyle.Default, handler:nil);
        
        alert4.show();
        
        //self.presentViewController(alert, animated: true, completion: nil);
    }
    
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
    
    func pickerView2(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> String {
        //myLabel.text = pickerData[row]
        var selectState1 = pickerData[row]
        println(selectState1)
        
        return selectState1
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
        return 200
    }
    
    func numberOfComponentsInPickerView1(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView1(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData2.count
    }
    
    //MARK: Delegates
    func pickerView1(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData2[row]
    }
    
    func pickerView1(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) ->String {
        //myLabel.text = pickerData[row]
        var selectState2 = pickerData2[row]
        println(selectState2)
        return selectState2
    }
    
    func pickerView1(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerData2[row]
        var myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 15.0)!,NSForegroundColorAttributeName:UIColor.blueColor()])
        return myTitle
    }
    
    func pickerView1(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView {
        var pickerLabel = view as UILabel!
        if view == nil {  //if no label there yet
            pickerLabel = UILabel()
            
            //color  and center the label's background
            let hue = CGFloat(row)/CGFloat(pickerData.count)
            pickerLabel.backgroundColor = UIColor(hue: hue, saturation: 1.0, brightness:1.0, alpha: 1.0)
            pickerLabel.textAlignment = .Center
            
        }
        let titleData = pickerData2[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 26.0)!,NSForegroundColorAttributeName:UIColor.blackColor()])
        pickerLabel!.attributedText = myTitle
        
        return pickerLabel
        
    }
    
    //size the components of the UIPickerView
    func pickerView1(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36.0
    }
    
    func pickerView1(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 200
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
            
            var tempState1 = pickerView2(myPicker, didSelectRow: row, inComponent: component)
            var tempState2 = pickerView1(myPicker2, didSelectRow: row1, inComponent: component1 )
            println(dateV)
            println(music)
            println(smoker)
            println(role)
            println(gender)
            println(tempState1)
            println(tempState2)
            println(login![0].email)
            println(goingFrom)
            println(goingto)
            ParseData.uploadDataPreferences(login![0].email , minAge : minage, maxAge: maxage, music: musicPreferenceTextField.text!, smoker : smoker , date : dateString, occupants : numoc , luggage : lugg, gender : gender, role : role, goingFrom: goingFrom ,goingTo : goingto, fromState :tempState1,  toState : tempState2)
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
        picker()
        pickerdestinationSt()
        pickerSourceSt()
        myPicker.delegate = self
        myPicker.dataSource = self
        myPicker2.delegate = self
        myPicker2.dataSource = self
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

