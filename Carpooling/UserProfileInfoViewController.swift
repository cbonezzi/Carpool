//
//  UserProfileInfoViewController.swift
//  Carpooling
//
//  Created by Aashay on 4/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

import UIKit

class UserProfileInfoViewController: UIViewController {

      
    var usernameTable : [String]!
   
    var user_email : String = ""
    
    @IBOutlet weak var test: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test.text = user_email
        //println()
        //Add something for test?
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//check
    
    
}
