//
//  FourthViewController.swift
//  Pool-IT
//
//  Created by Aashay on 2/20/15.
//  Copyright (c) 2015 Aashay. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController , UITableViewDataSource {
    
    @IBOutlet weak var tempTable: UITableView!
    
    var signup_page = FBLoginView.self
    let preferences = [("Are you a smoker?","Yes","No"),("Are you male?","Male","Female"),
        ("What age group do you prefer?","Yes","No"), ("Do you have occupants?","Yes","No"),
        ("Do you have luggage?","Yes","No"), ("Should we write these better?","Yes","No")]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
    }
    
    func tableView(tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
    
        return preferences.count
    }
    
    func tableView(tableView : UITableView , cellForRowAtIndexPath indexpath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell" ,forIndexPath: indexpath) as UITableViewCell
        let (preference,ans1,ans2) = preferences[indexpath.row]
        cell.textLabel!.text = preference
        cell.detailTextLabel?.text = ans1
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Preferences"
    }
    
    @IBAction func submitPressed(sender: UIButton) {
        //var test = signup_page
        var new_user = PFObject(className: "Preferences")
        //new_user["email"] = user.objectForKey("email") as String
        //new_user["username"] = (user.name)
        //new_user["gender"] = user.objectForKey("gender") as String
        //new_user.saveInBackgroundWithBlock {
        //    (success: Bool, error: NSError!) -> Void in
        //    if (success) {
                // The object has been saved.
        //    } else {
                // There was a problem, check error.description
        //    }
        //}
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("Fourth View Controller !!!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
