//
//  ProjectWebViewVC.swift
//  Carpooling
//
//  Created by Aashay on 5/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

class ProjectWebViewVC: UIViewController {
    
   // @IBOutlet weak var theWebView: UIWebView!
    var login : [Login]!
    var projectURL: String = ""
    @IBOutlet weak var theWebView: UIWebView!
    
    
    
    @IBAction func goBackToApp(sender: AnyObject) {
    
        self.performSegueWithIdentifier("GoBackToApp_Segue", sender: self)
    }
    
    @IBAction func selectanotherbackPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("BankRedirectGoBack_Segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("preparing for seque")
        
        if (segue.identifier == "BankRedirectGoBack_Segue"){
            let destVC: PayViewController = segue.destinationViewController as PayViewController
            destVC.login = login
        }
        if (segue.identifier == "GoBackToApp_Segue"){
            let destVC: UserActivityViewController = segue.destinationViewController as UserActivityViewController
            destVC.login = login
        }
        
        
    }
    
    override func viewDidLoad() {
        
        // maybe okay
        //   nsurl: NSURL = NSURL(string: projectURL)!
        // but probably better
        let nsurl: NSURL = NSURL(string: projectURL.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!)!
        
        let request: NSURLRequest = NSURLRequest(URL: nsurl)
        theWebView.loadRequest(request)
    }
}
