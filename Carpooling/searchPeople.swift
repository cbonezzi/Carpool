//
//  searchPeople.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class searchPeople: UIViewController, UIAlertViewDelegate,UIPickerViewDataSource, UIPickerViewDelegate {
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    var temp = 0
    var Role: String = ""
    //var alert = UIAlertController(title:"Alert", message:"Fields cannot be empty!!", preferredStyle: UIAlertControllerStyle.Alert)
    var alert = UIAlertView(title: "Alert", message: "Please fill all fields.", delegate: nil, cancelButtonTitle: "OK")
    
    var alert1 = UIAlertView(title: "Alert", message: "No user found.", delegate: nil, cancelButtonTitle: "OK")
    
    @IBOutlet weak var smokingSelection: UISegmentedControl!
    
    @IBOutlet weak var numOccupant: UITextField!
    @IBOutlet weak var numLuggage: UITextField!
    @IBOutlet weak var GoingFrom: UITextField!
    @IBOutlet weak var GoingTo: UITextField!
    
    @IBOutlet weak var date: UIDatePicker!
    var loggedUser2 : PUser!
    var stuffUser : Prefer!
    var selectState1: String!
    var selectState2: String!
    
    func picker(){
        date.transform = CGAffineTransformMakeScale(0.8, 0.6)
        date.setValue(UIColor.whiteColor(), forKey: "textColor")
        
    }
    func pickerSourceSt(){
        myPicker.transform = CGAffineTransformMakeScale(0.8, 0.6)
        myPicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        
    }
    func pickerdestinationSt(){
        mypicker2.transform = CGAffineTransformMakeScale(0.8, 0.6)
        mypicker2.setValue(UIColor.whiteColor(), forKey: "textColor")
        
    }


    //var searchUserList : SearchUsers!
    @IBAction func RoleSegment(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            Role = "Driver"
            temp = 1
        }
        else if sender.selectedSegmentIndex == 1 {
            Role = "Passenger"
            temp = 2
        }

    }
    
    func displayMyAlertMessage1()
    {
        alert1.show()
    }
    
    func displayMyAlertMessage()
    {
        alert.show()
    }
    
    @IBAction func gobackPressed(sender: UIButton) {
         self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    
    @IBOutlet weak var mypicker2: UIPickerView!
    @IBOutlet weak var myPicker: UIPickerView!
    
    let pickerData = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","District Of Columbia","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri"," Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West virginia","Wisconsin","Wyoming"]
    
    let pickerData2 = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","District Of Columbia","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri"," Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West virginia","Wisconsin","Wyoming"]
    

    
    
    @IBAction func search(sender: AnyObject) {
         var dateV =  self.date.date
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //format style. Browse online to get a format that fits your needs.
        var dateString = dateFormatter.stringFromDate(dateV)
        println(dateString)

        
        if (numOccupant.text.isEmpty || numLuggage.text.isEmpty
        || GoingFrom.text.isEmpty || GoingTo.text.isEmpty /*|| Role.isEmpty*/) {
    
            self.displayMyAlertMessage()
                return
        }
            
       
        
        else {
            ParseData.RetrieveDataForSearch(numOccupant.text, numLuggage: numLuggage.text, Role1 : Role ,GoingFrom: GoingFrom.text, GoingTo: GoingTo.text, date : dateString ) {
            
            (StuffUser: Prefer) in
            self.stuffUser = StuffUser
                
            if (self.stuffUser.list.count > 0) {
                println("in if")
            self.performSegueWithIdentifier("ShowPeople_Segue", sender: self)
                }
                else {
                println("in else")
                    self.displayMyAlertMessage1()
                }
                //(loggedUser: PUser) in
                //println(loggedUser)
                //self.loggedUser = loggedUser
                //self.performSegueWithIdentifier("showPeople", sender: self)
            }
        }
    
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowPeople_Segue") {
            var childVC : searchList = segue.destinationViewController as searchList
            childVC.listuser = stuffUser.list
            childVC.login = login!
            childVC.sourceData = GoingFrom.text
            childVC.destinationData = GoingTo.text            
        }
            //childVC.prefer = //loggedUser.RetrieveUserFromClass()
        //    println("profile segue firing")
        if (segue.identifier == "UserActivity_Segue") {
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
            if(login != nil){
                childVC.login = login!
            }
            println("Welcome to userActivity")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker()
        pickerdestinationSt()
        pickerSourceSt()
        myPicker.delegate = self
        myPicker.dataSource = self
        mypicker2.delegate = self
        mypicker2.dataSource = self
            //alert.show()
            // Do any additional setup after loading the view, typically from a nib.
            
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myLabel.text = pickerData[row]
        var selectState1 = pickerData[row]
        println(selectState1)
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
    
    func pickerView1(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myLabel.text = pickerData[row]
        var selectState2 = pickerData2[row]
        println(selectState2)
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
    


        
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
}
