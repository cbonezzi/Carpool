//
//  CarpoolingTests.swift
//  CarpoolingTests
//
//  Created by Cesar on 2/16/15.
//  Copyright (c) 2015 Software Eng. Proj. All rights reserved.
//

import UIKit
import XCTest

class CarpoolingTests: XCTestCase {
    
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // creating a button in order to simulate the
    let myFirstLabel = UILabel()
    let myFirstButton = UIButton()
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testHomeViewDidLoad()
    {
        // we only have access to this if we import our project above
        let homev = HomeViewController()
        let gsv = GetStartedViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(homev.view, "Home View Did Not load")
        
        homev.prepareForSegue((UIStoryboardSegue(identifier: "Start_Segue", source: homev, destination: gsv)), sender: myFirstButton)
        XCTAssertNotNil(gsv.view, "Login View Did Not load")
        

    }
    
    func testGSViewDidLoad()
    {
        // we only have access to this if we import our project above
        let gsv = GetStartedViewController()
        let logv = LoginViewController()
        let sigv = SignupViewController()
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(gsv.view, "Get Started View Did Not load")
        
        gsv.prepareForSegue((UIStoryboardSegue(identifier: "Login_Segue", source: gsv, destination: logv)), sender: myFirstButton)
        XCTAssertNotNil(logv.view, "Login View Did Not load")
        
        
        gsv.prepareForSegue((UIStoryboardSegue(identifier: "Signup_Segue", source: gsv, destination: sigv)), sender: myFirstButton)
        XCTAssertNotNil(sigv.view, "Signup View Did Not load")

    }

    func testLoginViewDidLoad()
    {
        // we only have access to this if we import our project above
        let logv = LoginViewController()
        let uav = UserActivityViewController()
        let sigv = SignupViewController()
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
            
            private override func show(){
                showWasCalled = true
            }
        }
        
        let Fake = FakeAlertView()
        
        logv.displayMyAlertMessage()
        XCTAssertFalse(Fake.showWasCalled)

        //logv = prepareForSegu
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(logv.view, "Login View Did Not load")
        logv.prepareForSegue((UIStoryboardSegue(identifier: "UserActivity_Segue", source: logv, destination: uav)), sender: myFirstButton)
        XCTAssertNotNil(uav.view, "User Activity View Did Not load")

        
        logv.prepareForSegue((UIStoryboardSegue(identifier: "Signup_Segue", source: logv, destination: sigv)), sender: myFirstButton)
        XCTAssertNotNil(sigv.view, "Signup View Did Not load")

    }

    func testSignupViewDidLoad()
    {
        // we only have access to this if we import our project above
        let sigv = SignupViewController()
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
            
            private override func show(){
                showWasCalled = true
            }
        }
        //sigv.performSegueWithIdentifier(<#identifier: String?#>, sender: <#AnyObject?#>)
        let Fake = FakeAlertView()
        
        sigv.displayMyAlertMessage()
    
        XCTAssertFalse(Fake.showWasCalled)

        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(sigv.view, "Signup View Did Not load")

    }
    
    func testAlertMessage1DidLoad()
    {
        // we only have access to this if we import our project above
        let sigv = SignupViewController()
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
            
            private override func show(){
                showWasCalled = true
            }
        }
        //sigv.performSegueWithIdentifier(<#identifier: String?#>, sender: <#AnyObject?#>)
        let Fake = FakeAlertView()
        
        sigv.displayMyAlertMessage1()
        
        XCTAssertFalse(Fake.showWasCalled)
        
        
    }
    
    func testAlertMessage2DidLoad()
    {
        // we only have access to this if we import our project above
        let sigv = SignupViewController()
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
            
            private override func show(){
                showWasCalled = true
            }
        }
        //sigv.performSegueWithIdentifier(<#identifier: String?#>, sender: <#AnyObject?#>)
        let Fake = FakeAlertView()
        
        sigv.displayMyAlertMessage2()
        
        XCTAssertFalse(Fake.showWasCalled)
        
    }


    func testProfileViewDidLoad()
    {
        // we only have access to this if we import our project above
        let prov = ProfileViewController()
        let uav = UserActivityViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(prov.view, "Profile View Did Not load")
        prov.prepareForSegue((UIStoryboardSegue(identifier: "UserActivity_Segue", source: prov, destination: uav)), sender: myFirstButton)
        XCTAssertNotNil(uav.view, "User Activity View Did Not load")
    }
    
    func testPreferencesViewDidLoad()
    {
        // we only have access to this if we import our project above
        let prev = PreferencesViewController()
        // we only have access to this if we import our project above
        let uav = UserActivityViewController()
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
            
            private override func show(){
                showWasCalled = true
            }
        }
        
        let Fake = FakeAlertView()
        prev.displayMyAlertMessage()
        
        // assert that the ViewController.view is not nil

        XCTAssertFalse(Fake.showWasCalled)
        prev.prepareForSegue((UIStoryboardSegue(identifier: "UserActivity_Segue", source: prev, destination: uav)), sender: myFirstButton)
        
        
        XCTAssertNotNil(uav.view, "User Activity View Did Not load")
    }
    
    func testUAViewDidLoad()
    {
        // we only have access to this if we import our project above
        let uav = UserActivityViewController()
        let prov = ProfileViewController()
        let prev = PreferencesViewController()
        let sp = searchPeople()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(uav.view, "User Activity View Did Not load")
        uav.prepareForSegue((UIStoryboardSegue(identifier: "SearchPeople_Segue", source: uav, destination: sp)), sender: myFirstButton)
        XCTAssertNotNil(sp.view, "Search People View Did Not load")
       
        
        uav.prepareForSegue((UIStoryboardSegue(identifier: "Preferences_Segue", source: uav, destination: prev)), sender: myFirstButton)
        XCTAssertNotNil(prev.view, "Preferences View Did Not load")
        
        uav.prepareForSegue((UIStoryboardSegue(identifier: "Profile_Segue", source: uav, destination: prov)), sender: myFirstButton)
        XCTAssertNotNil(prov.view, "Profile View Did Not load")
        

    }
    
    func testSearchPeopleDidLoad()
    {
        // we only have access to this if we import our project above
        let sp = searchPeople()
        let uav = UserActivityViewController()
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
           
            private override func show(){
                showWasCalled = true
            }
        }
        sp.viewDidLoad()
        
        let Fake = FakeAlertView()
        sp.displayMyAlertMessage()
        sp.displayMyAlertMessage1()
        XCTAssertFalse(Fake.showWasCalled)
        
         sp.prepareForSegue((UIStoryboardSegue(identifier: "UserActivity_Segue", source: sp, destination: uav)), sender: myFirstButton)
         XCTAssertNotNil(uav.view, "User Activity View Did Not load")
    }
    
    func testShowPeopleButton(){
        let sp = searchPeople()
        let sl = searchList()
        
        
        // creating the segue for simulating the
        
       
        sp.prepareForSegue((UIStoryboardSegue(identifier: "ShowPeople_Segue", source: sp, destination: sl)), sender: myFirstButton)
       
       
       XCTAssertNotNil(sp.view, "User Activity View Did Not load")
        
        
    }
    
    func testParseSearch(){
        var expectation:XCTestExpectation?
        var stuffUser : Prefer!
        let pm : ParseModel = ParseModel()
        let sp = searchPeople()
        let sl = searchList()
        
        //sp.search(myFirstButton)
        //sp.prepareForSegue((UIStoryboardSegue(identifier: "ShowPeople_Segue", source: sp, destination: sl)), sender: myFirstButton)
        expectation = self.expectationWithDescription("asynchronous request")
        
        //Networkclass.getThing("http://api.things.com/someid", delegate: self)
        
        
        pm.RetrieveDataForSearch("1", numLuggage: "2", Role1: "Passenger", GoingFrom: "iowacity", GoingTo: "chicago"){
            (StuffUser: Prefer) in
            stuffUser = StuffUser
            self.waitForExpectationsWithTimeout(10.0, handler:nil)
        }
        
       
        //self.waitForExpectationsWithTimeout(10.0, handler:nil)
        expectation?.fulfill()
        
        //var stuffUser : Prefer!
        
        //let pm = ParseModel()
        
        //pm.RetrieveDataForSearch("1", numLuggage: "2", Role1: "Passenger", GoingFrom: "iowacity", GoingTo: "chicago"){
        //    (StuffUser: Prefer) in
        //    stuffUser = StuffUser
        //}
        //XCTAssertNotNil(stuffUser, "Not Nil")
    }
}
