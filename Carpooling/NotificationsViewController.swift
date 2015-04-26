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
        
        // look into this for the notification docs to learn whether the installation is set to a particular object
        let push = PFPush()
        push.setChannel("Giants")
        push.setMessage(textView.text)
        push.sendPushInBackground()
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
    
    /**
    * Called when the user click on the view (outside the UITextField).
    */
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
