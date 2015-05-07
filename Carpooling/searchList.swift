//
//  searchList.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit
class searchList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

   
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    var name :String!
    var sourceData : String = String()
    var destinationData : String = String()
    
    var CurrentLocation : LocationInfo!
    var DestLocation : LocationInfo!
    
    @IBOutlet weak var theTableView: UITableView!
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var usernameHolder2: UILabel!
    
    @IBOutlet weak var usernameHolder1: UILabel!
    
       @IBOutlet weak var usernameHolder3: UILabel!
    
    var user_email = UserProfileInfoViewController.self
    var prefer : [Prefer]?
    var listuser : [String]!
    //var copy_listuser : listuser!
    
    //var usernameOfReturnedList : [String] = []
    
        var usernameOfReturnedList : String!
    
       func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    // this is use to mark the origin target
    func markOrigin(){
        
        // creates location for placing marker on map
        var cameraO = GMSCameraPosition.cameraWithLatitude(CurrentLocation.latitude_source,
            longitude:CurrentLocation.longitude_source, zoom:6)
        
        // creates marker
        var markerO = GMSMarker()
        markerO.position = cameraO.target
        markerO.snippet = sourceData
        markerO.appearAnimation = kGMSMarkerAnimationPop
        markerO.map = mapView
    }
    
    // this is use to mark the destination target
    func markDestination(){
        var cameraD = GMSCameraPosition.cameraWithLatitude(CurrentLocation.latitude_destination,
            longitude:CurrentLocation.longitude_destination, zoom:6)
        
        // creates marker
        var markerD = GMSMarker()
        markerD.position = cameraD.target
        markerD.snippet = destinationData
        markerD.appearAnimation = kGMSMarkerAnimationPop
        markerD.map = mapView
    }
    
    // this is used to center the map between the two target locations
    func centerMap(){
        var middle_lat = (CurrentLocation.latitude_source + CurrentLocation.latitude_destination)/2
        var middle_lon = (CurrentLocation.longitude_source + CurrentLocation.longitude_destination)/2
        var cameraMiddle = GMSCameraPosition.cameraWithLatitude(middle_lat,
            longitude:middle_lon, zoom:6)
        var markerC = GMSMarker()
        mapView.camera = cameraMiddle
        
    }
    
    // this is used to draw polyline between two locations
    func drawPathBetween(){
        var path = GMSMutablePath()
        path.addLatitude(CurrentLocation.latitude_source, longitude: CurrentLocation.longitude_source)
        path.addLatitude(CurrentLocation.latitude_destination, longitude: CurrentLocation.longitude_destination)
        
        var polyline = GMSPolyline(path: path)
        polyline.strokeColor = UIColor.blueColor()
        polyline.strokeWidth = 5.0
        polyline.map = mapView
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        theTableView.dataSource = self
        theTableView.delegate = self
        var cell:UITableViewCell = theTableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        var usernameOfReturnedList = listuser![indexPath.row]
        println(listuser![indexPath.row])
        println(usernameOfReturnedList)
        //cell.textLabel!.text = "hello"
        cell.textLabel!.text = usernameOfReturnedList
        var name : String = cell.textLabel!.text!
        println (name)
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 20
      
    
        return listuser!.count
    }
        // from james' code
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //self.performSegueWithIdentifier("displayProfile_Segue", sender: UITableViewCell.self)
        println(usernameOfReturnedList)

        println("did select tv row" + String(indexPath.row))
        
    }
    
    func display() -> String{
        var name: String = usernameOfReturnedList
        return name
    }
    
      @IBAction func gobackPressed(sender: UIButton) {
        self.performSegueWithIdentifier("goBackToSearchPeople_segue", sender: self)
    }
    
    // Removed because we are displaying list in table view
    func Update(){
        println("Hellooo!!!")
        //var helloUser = User1.RetrieveUserFromClass()
               if(prefer != nil){
            usernameHolder1.text = listuser![0]
            //print(usernameHolder1.text)
            usernameHolder2.text = listuser![1]
            //usernameHolder3.text = prefer![2].email
        
        }
    }
    
    func CallMapUpdate(){
        markOrigin()
        markDestination()
        centerMap()
        drawPathBetween()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "UserProfileView_Segue"){
            var child2VC: UserProfileInfoViewController = segue.destinationViewController as UserProfileInfoViewController
            let indexPath = self.theTableView.indexPathForSelectedRow()!
            var destinationTitle = (self.usernameOfReturnedList)
            child2VC.user_email = listuser[indexPath.item]
            child2VC.login = login!
            child2VC.listuser = listuser
            child2VC.CurrentLocation = CurrentLocation
            
        }
        if (segue.identifier == "goBackToSearchPeople_segue"){
            var child2VC : searchPeople = segue.destinationViewController as searchPeople
            child2VC.login = login!
        }
    }        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green.jpg")!)
        if (CurrentLocation != nil){
//        markOrigin()
//        markDestination()
//        centerMap()
//        drawPathBetween()
//        }
            self.CallMapUpdate()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}