//
//  DistanceCalculatorViewController.swift
//  Carpooling
//
//  Created by Aashay on 4/30/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit

class DistancCalculatorViewController: UIViewController, CLLocationManagerDelegate {
    
    // variable to hold the current logged in user
    var login : [Login]!

    @IBOutlet weak var latitude: UILabel!

    @IBOutlet weak var longitude: UILabel!

    @IBOutlet weak var horizontalAccuracy: UILabel!

    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var verticalAccuracy: UILabel!

    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var distanceMiles: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    @IBAction func resetDistance(sender: AnyObject) {
        
        startLocation = nil
        distanceMiles.text = "0"
        distance.text = "0"
    }
    //var totalAmountDue = 0
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    @IBAction func backPressed(sender: UIButton) {
        self.performSegueWithIdentifier("goToUserActivity_segue", sender: self )
    }
    
    @IBAction func payButton(sender: AnyObject) {
         self.performSegueWithIdentifier("bankRedirect_segue", sender: self)
    }
    func locationManager(manager: CLLocationManager!,
        didUpdateLocations locations: [AnyObject]!)
    {
        var latestLocation: AnyObject = locations[locations.count - 1]
        
        latitude.text = String(format: "%.4f",
            latestLocation.coordinate.latitude)
        longitude.text = String(format: "%.4f",
            latestLocation.coordinate.longitude)
        altitude.text = String(format: "%.4f",
            latestLocation.altitude)
        
        if startLocation == nil {
            startLocation = latestLocation as CLLocation
        }
        
        var distanceBetween: CLLocationDistance =
        latestLocation.distanceFromLocation(startLocation)
        
        distanceMiles.text = String(format: "%.4f", distanceBetween * 0.000621371)
         distance.text = String(format: "%.4f", distanceBetween)
        
        
        // THIS IS HOW YOU CONVERT A STRING TO DOUBLE
        
        var totalAmount1 = (distanceMiles.text! as NSString).doubleValue
        var totalAmountDue = totalAmount1 * 0.20
        
        totalAmount.text = String(format: "%.2f", totalAmountDue)
        
        
    }
    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!) {
            
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "goToUserActivity_segue"){
            var childVC : UserActivityViewController = segue.destinationViewController as UserActivityViewController
            childVC.login = login!
        }
        if (segue.identifier == "bankRedirect_segue"){
            var childVC : PayViewController = segue.destinationViewController as PayViewController
            childVC.login = login
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green.jpg")!)
        
        //locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
        //alert.show()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}