//
//  Login.swift
//  Carpooling
//
//  Created by Cesar on 3/11/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit

class LoginView: UIViewController {
    
    @IBOutlet weak var passwordtextLabel: UITextField!
    @IBOutlet weak var logintextLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println(" Login View !!!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
