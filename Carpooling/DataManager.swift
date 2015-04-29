//
//  DataManager.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/2/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import Foundation

let TopAppURL = "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json"

let googleURL = "https://maps.googleapis.com/maps/api/geocode/json?address="
class DataManager {
  
    class func getTopAppsDataFromItunesWithSuccess(origin: String, origin_state: String, destination: String, destination_state: String, success: (iTunesData: NSData!) -> Void) {
    //1
      loadDataFromURL(NSURL(string: TopAppURL)!, completion:{(data, error) -> Void in  
    //loadDataFromURL(NSURL(string: googleURL + origin + ",%20" + origin_state + "&key=AIzaSyBa936coujKGuKjKFgfj-NAhnes1vKWwP0")!, completion:{(data, error) -> Void in
        //2
        if let urlData = data {
          //3
          success(iTunesData: urlData)
        }
    })
  }
  
  class func getTopAppsDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
      //2
      let filePath = NSBundle.mainBundle().pathForResource("TopApps",ofType:"json")
   
      var readError:NSError?
      if let data = NSData(contentsOfFile:filePath!,
        options: NSDataReadingOptions.DataReadingUncached,
        error:&readError) {
        success(data: data)
      }
    })
  }
  
  class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
    var session = NSURLSession.sharedSession()
    
    // Use NSURLSession to get data from an NSURL
    let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
      if let responseError = error {
        completion(data: nil, error: responseError)
      } else if let httpResponse = response as? NSHTTPURLResponse {
        if httpResponse.statusCode != 200 {
          var statusError = NSError(domain:"com.raywenderlich", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
          completion(data: nil, error: statusError)
        } else {
          completion(data: data, error: nil)
        }
      }
    })
    
    loadDataTask.resume()
  }
}