//
//  searchList.swift
//  Carpooling
//
//  Created by uics7 on 3/27/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation
import UIKit
class searchList: UIViewController {
    var loggedUser1 : LoginUser!
    var loggedUser : CurrentUser!
    var login : [Login]!
    var ParseData : ParseModel = ParseModel()
    
    
    @IBOutlet weak var usernameHolder2: UILabel!
    
    @IBOutlet weak var usernameHolder1: UILabel!
    
    
    @IBOutlet weak var usernameHolder3: UILabel!
    
    var prefer : [Prefer]?
    var listuser : [String]!
    
      @IBAction func gobackPressed(sender: UIButton) {
        self.performSegueWithIdentifier("SearchPeople_Segue", sender: self)
    }
    func Update(){
        println("Hellooo!!!")
        //var helloUser = User1.RetrieveUserFromClass()
               //if(prefer != nil){
            usernameHolder1.text = listuser![0]
            //print(usernameHolder1.text)
            usernameHolder2.text = listuser![1]
            //usernameHolder3.text = prefer![2].email
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // if (segue.identifier == "showPeople_Segue") {
        //   var childVC : searchList = segue.destinationViewController as searchList
        //     childVC.listuser = stuffUser.list
        //childVC.prefer = //loggedUser.RetrieveUserFromClass()
        //    println("profile segue firing")
        if (segue.identifier == "SearchPeople_Segue") {
            var childVC : searchPeople = segue.destinationViewController as searchPeople
            childVC.login = login!
            println("welcome to userActivity")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Update()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}