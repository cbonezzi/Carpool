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
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(logv.view, "Login View Did Not load")
    }

    func testSignupViewDidLoad()
    {
        // we only have access to this if we import our project above
        let sigv = SignupViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(sigv.view, "Login View Did Not load")
    }


    func testProfileViewDidLoad()
    {
        // we only have access to this if we import our project above
        let logv = ProfileViewController()
        
        // assert that the ViewController.view is not nil
        XCTAssertNotNil(logv.view, "Login View Did Not load")
    }
    
}
