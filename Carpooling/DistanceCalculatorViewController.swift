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
    }
    //var totalAmountDue = 0
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    func locationManager(manager: CLLocationManager!,
        didUpdateLocations locations: [AnyObject]!)
    {
        var latestLocation: AnyObject = locations[locations.count - 1]
        
        latitude.text = String(format: "%.4f",
            latestLocation.coordinate.latitude)
        longitude.text = String(format: "%.4f",
            latestLocation.coordinate.longitude)
        horizontalAccuracy.text = String(format: "%.4f",
            latestLocation.horizontalAccuracy)
        altitude.text = String(format: "%.4f",
            latestLocation.altitude)
        verticalAccuracy.text = String(format: "%.4f",
            latestLocation.verticalAccuracy)
        
        
        if startLocation == nil {
            startLocation = latestLocation as CLLocation
        }
        
        var distanceBetween: CLLocationDistance =
        latestLocation.distanceFromLocation(startLocation)
        
        distanceMiles.text = String(format: "%.2f", distanceBetween * 0.000621371)
         distance.text = String(format: "%.2f", distanceBetween)
        
        
        // THIS IS HOW YOU CONVERT A STRING TO DOUBLE
        
        var totalAmount1 = (distanceMiles.text! as NSString).doubleValue
        var totalAmountDue = totalAmount1 * 0.20
        
        totalAmount.text = String(format: "%.2f", totalAmountDue)
        
        
    }
    
    func locationManager(manager: CLLocationManager!,
        didFailWithError error: NSError!) {
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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