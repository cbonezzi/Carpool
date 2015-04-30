//
//  searchList.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit
class searchList: UIViewController,UITableViewDataSource, UITableViewDelegate {
    

   
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    var name :String!
    var sourceData : String = String()
    var destinationData : String = String()
    
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
        self.performSegueWithIdentifier("SearchPeople_Segue", sender: self)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       // if (segue.identifier == "displayProfile_Segue"){
                  // var child2VC : searchList = segue.destinationViewController as searchList
            var child2VC: UserProfileInfoViewController = segue.destinationViewController as UserProfileInfoViewController
            let indexPath = self.theTableView.indexPathForSelectedRow()!
            var destinationTitle = (self.usernameOfReturnedList)
        
            child2VC.user_email = listuser[indexPath.item]//[indexPath.row]
            //println(destinationTitle[indexPath.row])
            //println("name" + name)
            //childVC.listuser = stuffUser.list
            //childVC.login = login!
            
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        println(usernameOfReturnedList)
//            let child2VC: UserProfileInfoViewController = segue.destinationViewController as UserProfileInfoViewController
//        println(usernameOfReturnedList)
//            let indexPath = self.theTableView.indexPathForSelectedRow()!
//            let index: Int = theTableView.indexPathForSelectedRow()!.row
        //  let destinationTitle = self.filteredBooths[indexPath.row].name
        
       // var destinationTitle = (self.usernameOfReturnedList)
//        println(usernameOfReturnedList)
        //var destinationTitle = cell.textLabel!.text
        //UserProfileInfoViewController.user_email = destinationTitle
        
        // destVC.projectURL = projects.projectURLForIndex(index)
        }


        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var camera = GMSCameraPosition.cameraWithLatitude(-33.868,
        longitude:151.2086, zoom:6)
        mapView.camera = camera
        

        var marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Hello World"
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}