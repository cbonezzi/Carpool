//
//  ThirdController.swift
//  Carpooling
//
//  Created by Cesar on 3/5/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit
import Parse

class NotificationsViewController : UIViewController, UITextViewDelegate  {
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet  var charRemainingLabel: UILabel! = UILabel()

    
    @IBAction func sendNotification(sender: AnyObject) {
        
        
        var sweet:PFObject = PFObject(className: "Sweets")
        sweet["content"] = textView.text
        sweet["user_email"] = PFUser.currentUser()
        
        sweet.saveInBackground()
        
        var push:PFPush = PFPush()
        push.setChannel("Notifications")
        
        var data:NSDictionary = ["alert":"", "badge":"0", "content-available":"1","sound":""]
        
        push.setData(data)
        push.sendPushInBackground()
        
        
        //self.navigationController.popToRootViewControllerAnimated(true)


    }
    
    func textView(textView: UITextView!,
        shouldChangeTextInRange range: NSRange,
        replacementText text: String!) -> Bool{
            
            var newLength:Int = (textView.text as NSString).length + (text as NSString).length - range.length
            var remainingChar:Int = 140 - newLength
            
            charRemainingLabel.text = "\(remainingChar)"
            
            return (newLength > 140) ? false : true
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.blackColor().CGColor
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 5
        textView.delegate = self
        
        textView.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
