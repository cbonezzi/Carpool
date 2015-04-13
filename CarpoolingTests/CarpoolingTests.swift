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
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(homev.view, "Home View Did Not load")
    }
    
    func testGSViewDidLoad()
    {
        // we only have access to this if we import our project above
        let gsv = GetStartedViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(gsv.view, "Get Started View Did Not load")
    }

    func testLoginViewDidLoad()
    {
        // we only have access to this if we import our project above
        let logv = LoginViewController()
        // we only have access to this if we import our project above
        
        
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
    }

    func testSignupViewDidLoad()
    {
        // we only have access to this if we import our project above
        let sigv = SignupViewController()
        // we only have access to this if we import our project above
        
        
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
        sigv.displayMyAlertMessage1()
    
        XCTAssertFalse(Fake.showWasCalled)

        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(sigv.view, "Signup View Did Not load")
    }


    func testProfileViewDidLoad()
    {
        // we only have access to this if we import our project above
        let prov = ProfileViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(prov.view, "Profile View Did Not load")
    }
    
    func testPreferencesViewDidLoad()
    {
        // we only have access to this if we import our project above
        let prev = PreferencesViewController()
        // we only have access to this if we import our project above
        
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
            
            private override func show(){
                showWasCalled = true
            }
        }
        
        let Fake = FakeAlertView()
        
        prev.displayMyAlertMessage()
        XCTAssertFalse(Fake.showWasCalled)

        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(prev.view, "Preferences View Did Not load")
    }
    
    func testUAViewDidLoad()
    {
        // we only have access to this if we import our project above
        let uav = UserActivityViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(uav.view, "User Activity View Did Not load")
    }
    
    func testSearchPeopleDidLoad()
    {
        // we only have access to this if we import our project above
        let sp = searchPeople()
        
        //fake alert class
        class FakeAlertView: UIAlertView{
            var showWasCalled = false
           
            private override func show(){
                showWasCalled = true
            }
        }
        sp.viewDidLoad()
        
        let Fake = FakeAlertView()
        //sp.displayMyAlertMessage()
        sp.displayMyAlertMessage()
        sp.displayMyAlertMessage1()
        XCTAssertFalse(Fake.showWasCalled)
    }

    /*func testSearchListDidLoad()
    {
        // we only have access to this if we import our project above
        let sl = searchList()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(sl.view, "Search List Did Not load")
    }*/
}
