//
//  searchPeople.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class searchPeople: UIViewController, UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    
    // this is our hook for the current user
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    //var ParseM : ParseModelClass = ParseModelClass()
    var loginStatus : Bool = false
    var temp = 0
    var Role: String = ""
    
    // url for maps api
    var url_origin : String = String()
    var url_destination : String = String()
    var state_matching_origin : String = String()
    var state_matching_destination : String = String()
    var CurrentLocationSearch : LocationInfo!
    
    @IBOutlet weak var mypicker2: UIPickerView!
    @IBOutlet weak var myPicker: UIPickerView!
    
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
    
    //var alert = UIAlertController(title:"Alert", message:"Fields cannot be empty!!", preferredStyle: UIAlertControllerStyle.Alert)
    var alert = UIAlertView(title: "Alert", message: "Please fill all fields.", delegate: nil, cancelButtonTitle: "OK")
    
    var alert1 = UIAlertView(title: "Alert", message: "No user found.", delegate: nil, cancelButtonTitle: "OK")
    
    var alertState = UIAlertView(title: "Alert", message: "Mismatch between City and State", delegate: nil, cancelButtonTitle: "OK")
    
    @IBOutlet weak var smokingSelection: UISegmentedControl!
    
    @IBOutlet weak var numOccupant: UITextField!
    @IBOutlet weak var numLuggage: UITextField!
    @IBOutlet weak var GoingFrom: UITextField!
    @IBOutlet weak var GoingTo: UITextField!
    
    var loggedUser2 : PUser!
    var stuffUser : Prefer!
    
    @IBOutlet weak var date: UIDatePicker!
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
    
    func displayMyAlertStateWrongMessage(){
        alertState.show()
    }
    
    func getCoordinatesOrigin(source: String, destination: String, completion: (UserLocation: LocationInfo) -> Void) {
        var formatted_address_origin : String = String()
        var formatted_address_destination : String = String()
        
        // need to have ruchikas need state picker
        let origin_state = selectState1
        let dest_state = selectState2
        
        var origin_city_nospace : String = GoingFrom.text!.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        var dest_city_nospace : String = GoingTo.text!.stringByReplacingOccurrencesOfString(" ", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        // generating url requestt string
        if (origin_state != nil && dest_state != nil){
        url_origin = "https://maps.googleapis.com/maps/api/geocode/json?address=" +  origin_city_nospace + ",%20" + origin_state + "&key=AIzaSyBa936coujKGuKjKFgfj-NAhnes1vKWwP0"
        url_destination = "https://maps.googleapis.com/maps/api/geocode/json?address=" +  dest_city_nospace + ",%20" + dest_state + "&key=AIzaSyBa936coujKGuKjKFgfj-NAhnes1vKWwP0"
        
        // creating an instance of LocationInfo class to store the coordinates received
        // from maps
        var local : LocationInfo = LocationInfo()
        
        // origin request
        let searchURL = NSURL(string: url_origin)
        
        //Request made
        var request1: NSURLRequest = NSURLRequest(URL: searchURL!)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError?
            
            //converting to JSON Object
            var jsonResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments /*.MutableContainers*/, error: &err)
            
            // traversing tree structure for the JSON file received
            var lat : Double = Double()
            var lon : Double = Double()
            if let statusesArray = jsonResult as? NSDictionary{
                if let aStatus = statusesArray["results"] as? NSArray{
                    if let user = aStatus[0] as? NSDictionary{
                        formatted_address_origin = user["formatted_address"] as NSString
                        if let userName = user["geometry"] as? NSDictionary{
                            if let geometry = userName["location"] as? NSDictionary{
                                lat = geometry["lat"] as Double
                                lon = geometry["lng"] as Double
                            }
                        }
                    }
                }
            }
            local.latitude_source = Double()
            local.longitude_source = Double()
            
            local.latitude_source = lat
            local.longitude_source = lon
            
            self.state_matching_origin = formatted_address_origin
            
        })
        
        // destination request
        let searchURL2 = NSURL(string: url_destination)
        
        //Request made
        var request2: NSURLRequest = NSURLRequest(URL: searchURL2!)
        let queue2:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request2, queue: queue2, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError?
            //converting to JSON Object
            var jsonResult: AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments /*.MutableContainers*/, error: &err)
            
            var lat : Double = Double()
            var lon : Double = Double()
            if let statusesArray = jsonResult as? NSDictionary{
                if let aStatus = statusesArray["results"] as? NSArray{
                    if let user = aStatus[0] as? NSDictionary{
                        formatted_address_destination = user["formatted_address"] as NSString
                        if let userName = user["geometry"] as? NSDictionary{
                            if let geometry = userName["location"] as? NSDictionary{
                                lat = geometry["lat"] as Double
                                lon = geometry["lng"] as Double
                            }
                        }
                    }
                }
            }
            
            // storing data received on local which is a completion handler that is used
            // as a hook to acknowledge when the http request has returned data
            local.latitude_destination = Double()
            local.longitude_destination = Double()
            
            local.latitude_destination = lat
            local.longitude_destination = lon
            self.state_matching_destination = formatted_address_destination
            completion(UserLocation: local)
            })
        }
    }
    
    @IBAction func gobackPressed(sender: UIButton) {
         self.performSegueWithIdentifier("UserActivity_Segue", sender: self)
    }
    
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
            
            // maps stuff
            self.getCoordinatesOrigin(GoingFrom.text, destination: GoingTo.text){
                (CurrentLocation1: LocationInfo) in
                self.CurrentLocationSearch = CurrentLocation1
            }
            
            ParseData.RetrieveDataForSearch(numOccupant.text, numLuggage: numLuggage.text, Role1 : Role ,GoingFrom: GoingFrom.text, GoingTo: GoingTo.text, date : dateString, fromState : selectState1, toState : selectState2){
                
                (StuffUser: Prefer) in
                self.stuffUser = StuffUser
                
                if (self.stuffUser.list.count > 0) {
                    println("in if")
                    // this is a check for the string of city and state
                    if (self.state_matching_origin.uppercaseString == self.GoingFrom.text.uppercaseString + ", " + self.selectState1.uppercaseString + ", " + "USA") {/*&&*/
                        if (self.state_matching_destination.uppercaseString == self.GoingTo.text.uppercaseString + ", " + self.selectState2.uppercaseString + ", " + "USA") {
                            //println("Hello IOWA")
                            self.performSegueWithIdentifier("ShowPeople_Segue", sender: self)
                        }
                    }else if (self.state_matching_origin != self.GoingFrom.text + ", " + self.selectState1 + ", " + "USA") || (self.state_matching_destination != self.GoingTo.text + ", " + self.selectState2 + ", " + "USA"){
                        self.displayMyAlertStateWrongMessage()
                    }
                }
                else {
                    println("in else")
                    self.displayMyAlertMessage1()
                }
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
            childVC.CurrentLocation = self.CurrentLocationSearch
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
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green.jpg")!)
        picker()
        pickerdestinationSt()
        pickerSourceSt()
        myPicker.delegate = self
        myPicker.dataSource = self
        mypicker2.delegate = self
        mypicker2.dataSource = self
        
        //alert.show()
        // Do any additional setup after loading the view, typically from a nib.
        numOccupant.delegate = self
        numLuggage.delegate = self
        GoingFrom.delegate = self
        GoingTo.delegate = self
        //alert.show()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
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
        return 75
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
        selectState2 = pickerData2[row]
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
        return 15.0
    }
    
    func pickerView1(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 75
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
