//
//  PayViewController.swift
//  Carpooling
//
//  Created by Aashay on 5/2/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import Foundation

class PayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var login : [Login]!
    @IBOutlet weak var theTableView: UITableView!
    //@IBOutlet weak var theTableView: UITableView!
    
    var projects: ClassProjects!
    
    // three required methods of UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.numberOfProjects()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellNum: Int = indexPath.row
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("ProjectCell")! as UITableViewCell
        cell.textLabel!.text =  projects.projectNameForIndex(cellNum)
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    // optional UITableViewDelegate method
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("did select tv row" + String(indexPath.row))
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("preparing for seque")
        let destVC: ProjectWebViewVC = segue.destinationViewController as ProjectWebViewVC
        let index: Int = theTableView.indexPathForSelectedRow()!.row
        destVC.projectURL = projects.projectURLForIndex(index)
        destVC.login = login
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "green.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
        projects = ClassProjects()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
