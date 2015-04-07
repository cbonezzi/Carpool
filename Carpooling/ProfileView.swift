//
//  ProfileView.swift
//  Carpooling
//
//  Created by Cesar on 3/6/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit

class ProfileView: UIViewController {
    
    @IBOutlet weak var usernameHolder: UILabel!
    @IBOutlet weak var genderHolder: UILabel!
    @IBOutlet weak var musicHolder: UILabel!
    @IBOutlet weak var fromHolder: UILabel!
    @IBOutlet weak var toHolder: UILabel!
    @IBOutlet weak var luggageHolder: UILabel!
    @IBOutlet weak var occupantsHolder: UILabel!
    
    // needs to be optional
    var User1 : [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Update()
    }
    
    func Update(){
        //var helloUser = User1.RetrieveUserFromClass()
        if(User1 != nil){
            usernameHolder.text = User1![0].username
            genderHolder.text = User1![0].gender
            musicHolder.text = "nothing"
            fromHolder.text = "Iowa City"
            toHolder.text = "Chicago"
            luggageHolder.text = "2"
            occupantsHolder.text = "4"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}