////
////  TestUI.swift
////  WarbaTaskUITests
////
////  Created by Mahmoud Nasr on 3/27/19.
////  Copyright © 2019 Mahmoud Nasr. All rights reserved.
////
//
//import Foundation
//import XCTest
//
//@testable import WarbaTask
//class OnboardingUITests: XCTestCase {
//    var app: XCUIApplication!
//    
//    // MARK: - XCTestCase
//    
//    override func setUp() {
//        super.setUp()
//        
//        // Since UI tests are more expensive to run, it's usually a good idea to exit if a failure was encountered
//        continueAfterFailure = false
//        
//        app = XCUIApplication()
//        app.launch()
//        // We send a command line argument to our app, to enable it to reset its state
//        app.launchArguments.append("--uitesting")
//    }
//    
//    // MARK: - Tests
//    
//    func testGoingThroughOnboarding() {
//        app.launch()
//        
//        // Make sure we're displaying onboarding
//        XCTAssertTrue(app.isDisplayingOnboarding)
//        
//        // Swipe left three times to go through the pages
//        app.swipeLeft()
//        app.swipeLeft()
//        app.swipeLeft()
//        
//        // Tap the "Done" button
//        app.buttons["Done"].tap()
//        
//        // Onboarding should no longer be displayed
//        XCTAssertFalse(app.isDisplayingOnboarding)
//    }
//}
//extension XCUIApplication {
//    var isDisplayingOnboarding: Bool {
//        return otherElements["onboardingView"].exists
//    }
//}
